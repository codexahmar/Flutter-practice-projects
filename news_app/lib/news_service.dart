import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/Model/articleModel.dart';

class NewsService {
  static const String _apiKey = "24bf861ca24e6473d153f800be20fb80";
  Future<List<Articles>> fetchNewsByCategory(String category) async {
    final response = await http.get(Uri.parse(
        "https://gnews.io/api/v4/top-headlines?country=pk&category=$category&apikey=$_apiKey"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      List<dynamic> articlesJson = data["articles"];
      return articlesJson.map((json) => Articles.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }

}
