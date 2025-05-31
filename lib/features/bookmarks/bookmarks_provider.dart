import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app/features/news/models/article.dart';

final bookmarksProvider = StateNotifierProvider<BookmarksNotifier, List<Article>>(
  (ref) => BookmarksNotifier(),
);

class BookmarksNotifier extends StateNotifier<List<Article>> {
  BookmarksNotifier() : super([]) {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('bookmarks') ?? [];
    state = saved.map((e) => Article.fromJson(jsonDecode(e))).toList();
  }

  void _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = state.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('bookmarks', jsonList);
  }

  void add(Article article) {
    if (state.any((a) => a.url == article.url)) return;
    state = [...state, article];
    _saveToPrefs();
  }

  void remove(Article article) {
    state = state.where((a) => a.url != article.url).toList();
    _saveToPrefs();
  }
}
