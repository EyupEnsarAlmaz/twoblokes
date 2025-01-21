class NewsModel {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String content;
  final String publishedAt;
  final String source;

  NewsModel({
    required this.title,
    required this.content,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      source: json['source']['name'] ?? '',
    );
  }
}
