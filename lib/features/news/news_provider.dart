import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/article.dart';
import 'news_service.dart';

final newsProvider = FutureProvider<List<Article>>((ref) async {
  return NewsService.fetchArticles();
});
