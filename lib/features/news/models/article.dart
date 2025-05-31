class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String source; // ✅ Must be a string for persistence
  final DateTime publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.source,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      source: json['source'] is Map
          ? (json['source']['name'] ?? '')
          : (json['source'] ?? ''), // 👈 handles both from API and saved JSON
      publishedAt: DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'source': source, // ✅ stored as flat string
        'publishedAt': publishedAt.toIso8601String(),
      };
}
