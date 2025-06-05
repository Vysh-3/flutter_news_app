import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/article.dart';

class NewsService {
  static Future<List<Article>> fetchArticles() async {
    const apiKey = 'YOUR_NEWSAPI_KEY';
    final res = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'));

    
    final data = jsonDecode(res.body);
    return (data['articles'] as List).map((e) => Article.fromJson(e)).toList();
  }
}
