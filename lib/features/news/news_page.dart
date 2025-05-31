import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../bookmarks/bookmarks_provider.dart';
import '../webview/article_webview.dart';
import 'news_provider.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider);

    return news.when(
      data: (articles) => RefreshIndicator(
        onRefresh: () async => ref.refresh(newsProvider),
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (_, i) {
            final a = articles[i];
            return ListTile(
              leading: a.urlToImage.isNotEmpty && Uri.tryParse(a.urlToImage)?.hasAbsolutePath == true
    ? Image.network(
        a.urlToImage,
        width: 100,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
      )
    : const Icon(Icons.image_not_supported, size: 50),

              title: Text(a.title),
              subtitle: Text("${a.source} • ${DateFormat('dd MMMM, yyyy').format(a.publishedAt)}"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ArticleWebView(url: a.url))),
              trailing: IconButton(
  icon: Icon(
    ref.watch(bookmarksProvider).any((b) => b.url == a.url)
        ? Icons.bookmark
        : Icons.bookmark_add_outlined,
  ),
  onPressed: () {
    final notifier = ref.read(bookmarksProvider.notifier);
    final isBookmarked = ref.read(bookmarksProvider).any((b) => b.url == a.url);
    isBookmarked ? notifier.remove(a) : notifier.add(a);
  },
),

            );
          },
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
