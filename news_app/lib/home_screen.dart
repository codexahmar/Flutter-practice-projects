import 'package:flutter/material.dart';
import 'package:news_app/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var newsCategories = [
      "business",
      "entertainment",
      "health",
      "science",
      "sports",
      "technology"
    ];

    var categoryIcons = [
      Icons.business,
      Icons.movie,
      Icons.health_and_safety,
      Icons.science,
      Icons.sports,
      Icons.computer
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: "Schyler"),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notifications functionality
            },
          ),
        ],
        centerTitle: true,
        elevation: 10.0,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Choose a Category",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: newsCategories.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      height: 100,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen(
                                      categoryName: newsCategories[index])));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(
                                  categoryIcons[index],
                                  size: 40,
                                  color: Colors.deepPurple,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  newsCategories[index],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
