import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qoutes_app/quoteClass.dart';

class ApiService {
  Future<Quote> fetchRandomQuote() async {
    final response =
        await http.get(Uri.parse("https://zenquotes.io/api/random"));
    if (response.statusCode == 200) {
      List<dynamic> random = json.decode(response.body);
      return Quote.fromJson(random[0]);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
