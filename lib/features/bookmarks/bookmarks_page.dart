import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../webview/article_webview.dart';
import 'bookmarks_provider.dart';

class BookmarksPage extends ConsumerWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);

    if (bookmarks.isEmpty) {
      return const Center(child: Text("No bookmarks yet."));
    }

    return ListView.builder(
      itemCount: bookmarks.length,
      itemBuilder: (_, i) {
        final a = bookmarks[i];
        return ListTile(
          leading: Image.network(a.urlToImage, width: 100, fit: BoxFit.cover),
          title: Text(a.title),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ArticleWebView(url: a.url)),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => ref.read(bookmarksProvider.notifier).remove(a),
          ),
        );
      },
    );
  }
}
