import 'package:newsapi/models/source.dart';

class Article {
  Source source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishAt;
  String? content;

  Article(
      {required this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"] as String,
        urlToImage: json["urlToImage"],
        publishAt: json["publishedAt"],
        content: json["content"]);
  }
}