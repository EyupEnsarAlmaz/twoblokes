import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twoblokes/product/model/news_model.dart';

class NewsService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = 'c3cb7bb2b6544869ba7f3c6e9c4cffdc';

  Future<List<NewsModel>> getBusinessNews() async {
    try {
      final response = await http.get(
        Uri.parse(
            '$_baseUrl/top-headlines?country=us&category=business&apiKey=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];

        return articles.map((article) => NewsModel.fromJson(article)).toList();
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
