import 'package:news_app/models/source_model.dart';

class ArticleDataModel {
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleDataModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleDataModel.fromJson(Map<String, dynamic> json) => ArticleDataModel(
    source: SourceModel.formJson(json["source"]),
    author: json["author"] ?? "",
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    url: json["url"] ?? "",
    urlToImage: json["urlToImage"] ?? "",
    publishedAt: json["publishedAt"] ?? "",
    content: json["content"] ?? "",
  );
}

// class ArticleDataModel {
//   String? status;
//   List<Articles>? articles;
//
//
//   ArticleDataModel({
//     this.status,
//     this.articles,
//   });
//
//   ArticleDataModel.fromJson(dynamic json){
//     status = json['status'];
//     if (json['articles'] != null) {
//       articles = [];
//       json['articles'].forEach((v) {
//         articles?.add(Articles.fromJson(v));
//       });
//     }
//   }
// }
//
// class Articles {
//   SourceModel? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   String? publishedAt;
//    String? content;
//
//   Articles({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });
//
//   Articles.fromJson(dynamic json) {
//      source:SourceModel.formJson(json["source"]);
//      author: json["author"] ?? "",
//      title: json["title"] ?? "",
//      description: json["description"] ?? "",
//      url: json["url"] ?? "",
//      urlToImage: json["urlToImage"] ?? "",
//      publishedAt: json["publishedAt"] ?? "",
//      content: json["content"] ??"",
//    }
// }
