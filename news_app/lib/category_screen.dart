// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'Model/articleModel.dart';
import 'news_service.dart';
import 'articleDetail.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Articles>> _newsArticles;

  @override
  void initState() {
    super.initState();
    _newsArticles = NewsService().fetchNewsByCategory(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: FutureBuilder<List<Articles>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load news'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No news articles found'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var article = snapshot.data![index];

                return ListTile(
                  leading: article.image.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: article.image,
                          width: 100,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        )
                      : null,
                  title: Text(
                    article.title.isNotEmpty ? article.title : 'No title',
                    style: TextStyle(
                      fontSize: 20, // Adjust as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.description.isNotEmpty
                            ? article.description
                            : 'No description',
                        style: TextStyle(
                          fontSize: 16, // Adjust as needed
                          color: Colors.grey[600],
                        ),
                      ),
                      if (article.publishedAt.isNotEmpty)
                        Text(
                          'Published: ${article.publishedAt}',
                          style: TextStyle(
                            fontSize: 14, // Adjust as needed
                            color: Colors.grey[400],
                          ),
                        ),
                      if (article.source.name.isNotEmpty)
                        Text(
                          'Source: ${article.source.name}',
                          style: TextStyle(
                            fontSize: 14, // Adjust as needed
                            color: Colors.grey[400],
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailScreen(
                          article: article,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
