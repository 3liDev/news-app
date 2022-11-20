class NewsModel {
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsModel.fromJson(Map<String, dynamic> jsonData) => NewsModel(
        status: jsonData["status"],
        totalResults: jsonData["totalResults"],
        articles: List<Article>.from(
            jsonData["articles"].map((x) => Article.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       //"status": status,
  //       //"totalResults": totalResults,
  //       "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  //     };
}

class Article {
  Article({
    //required this.source,
    //required this.author,
    required this.title,
    required this.description,
    //required this.url,
    required this.urlToImage,
    //required this.publishedAt,
    //required this.content,
  });

  //Source source;
  //String? author;
  String title;
  String description;
  //String url;
  String urlToImage;
  //DateTime publishedAt;
  //String? content;

  factory Article.fromJson(Map<String, dynamic> jsonData) => Article(
        //source: Source.fromJson(jsonData["source"]),
        // ignore: prefer_if_null_operators
        //author: jsonData["author"] == null ? null : jsonData["author"],
        title: jsonData["title"] == null ? "no title" : jsonData['title'],
        description:
            // ignore: prefer_if_null_operators
            jsonData["description"] == null
                ? "no description"
                : jsonData["description"],
        //url: jsonData["url"],
        urlToImage:
            // ignore: prefer_if_null_operators
            jsonData["urlToImage"] == null
                ? "https://bitsofco.de/content/images/2018/12/broken-1.png"
                : jsonData["urlToImage"],
        //publishedAt: DateTime.parse(jsonData["publishedAt"]),
        // ignore: prefer_if_null_operators
        //content: jsonData["content"] == null ? null : jsonData["content"],
      );

  // Map<String, dynamic> toJson() => {
  //       //"source": source.toJson(),
  //       // ignore: prefer_if_null_operators, unnecessary_null_comparison
  //       //"author": author == null ? null : author,
  //       "title": title,
  //       // ignore: prefer_if_null_operators, unnecessary_null_comparison
  //       "description": description == null ? null : description,
  //       //"url": url,
  //       // ignore: prefer_if_null_operators, unnecessary_null_comparison
  //       "urlToImage": urlToImage == null ? null : urlToImage,
  //       //"publishedAt": publishedAt.toIso8601String(),
  //       // ignore: prefer_if_null_operators, unnecessary_null_comparison
  //       //"content": content == null ? null : content,
  //     };
}

// class Source {
//   Source({
//     required this.id,
//     required this.name,
//   });

//   String? id;
//   String name;

//   factory Source.fromJson(Map<String, dynamic> jsonData) => Source(
//         // ignore: prefer_if_null_operators
//         id: jsonData["id"] == null ? null : jsonData["id"],
//         name: jsonData["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         // ignore: prefer_if_null_operators, unnecessary_null_comparison
//         "id": id == null ? null : id,
//         "name": name,
//       };
// }
