class NewApiModel {
  String? status;
  int? totalResults;
  List? articles;

  NewApiModel({this.status, this.totalResults, this.articles});

  NewApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = json['articles'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['totalResults'] = this.totalResults;
  //   if (this.articles != null) {
  //     data['articles'] = this.articles!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ArticlesData {
  Map? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesData(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  // Articles.fromJson(Map<String, dynamic> json) {
  //   source =
  //       json['source'] != null ? new Source.fromJson(json['source']) : null;
  //   author = json['author'];
  //   title = json['title'];
  //   description = json['description'];
  //   url = json['url'];
  //   urlToImage = json['urlToImage'];
  //   publishedAt = json['publishedAt'];
  //   content = json['content'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.source != null) {
  //     data['source'] = this.source!.toJson();
  //   }
  //   data['author'] = this.author;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['url'] = this.url;
  //   data['urlToImage'] = this.urlToImage;
  //   data['publishedAt'] = this.publishedAt;
  //   data['content'] = this.content;
  //   return data;
  // }
}

// class Source {
//   Null? id;
//   String? name;

//   Source({this.id, this.name});

//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }


// class ApiServices {
//   ApiServices({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });

//   String status;
//   int totalResults;
//   List articles;

//   factory ApiServices.fromJson(Map<String, dynamic> json) => ApiServices(
//       status: json["status"],
//       totalResults: json["totalResults"],
//       articles: json["articles"]);

//   // Map<String, dynamic> toJson() => {
//   //       "status": status,
//   //       "totalResults": totalResults,
//   //       "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//   //     };
// }

// class ArticleData {
//   ArticleData({
//     // required this.source,
//     required this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     // required this.publishedAt,
//     required this.content,
//   });

//   // Map source;
//   String author;
//   String title;
//   String description;
//   String url;
//   String urlToImage;
//   // String publishedAt;
//   String content;

//   // factory Article.fromJson(Map<String, dynamic> json) => Article(
//   //       source: Source.fromJson(json["source"]),
//   //       author: json["author"] == null ? null : json["author"],
//   //       title: json["title"],
//   //       description: json["description"],
//   //       url: json["url"],
//   //       urlToImage: json["urlToImage"],
//   //       publishedAt: DateTime.parse(json["publishedAt"]),
//   //       content: json["content"],
//   //     );

//   // Map<String, dynamic> toJson() => {
//   //       "source": source.toJson(),
//   //       "author": author == null ? null : author,
//   //       "title": title,
//   //       "description": description,
//   //       "url": url,
//   //       "urlToImage": urlToImage,
//   //       "publishedAt": publishedAt.toIso8601String(),
//   //       "content": content,
//   //     };
// }
