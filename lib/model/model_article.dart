import 'source_model.dart';

class Article {
  String? title;
  String? url;
  String? author;
  String? content;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? sourceId;

  Article(
      {this.title,
      this.url,
      this.author,
      this.description,
      this.content,
      this.publishedAt,
      this.urlToImage,
      this.sourceId});
  factory Article.fromJson(Map<String, dynamic> json) {
    Article arc = Article(
        title: json['title'] as String,
        url: json['link'] as String,
        //author: json['creator'][0] as String,
        description: json['description'] as String,
        content: json['content'] as String,
        publishedAt: json['pubDate'] as String,
        urlToImage: json['image_url'] as String,
        sourceId: json['source_id'] as String);
    if (arc.urlToImage == null) {
      arc.urlToImage =
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmqDTHZL2PkarHYtXZURqck83NIdLFHSaKiA&usqp=CAU";
    }
    //print(arc.urlToImage);
    return arc;
  }

  static List<Article> articleFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Article.fromJson(data);
    }).toList();
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    Article arc = Article(
      author: map['creator'][0] != null
          ? map['creator'][0] as String
          : "Author null",
      title: map['title'] != null ? map['title'] as String : "title Null",
      description: map['description'] != null
          ? map['description'] as String
          : "description Null",
      url: map['link'] != null
          ? map['link'] as String
          : "https://www.foxnews.com/world/kyiv-rocked-explosions-week-after-russian-strikes-across-ukraine",
      //
      //
      urlToImage: map['video_url'] != null
          ? map['urlToImage'] as String
          : "https://images.unsplash.com/photo-1665931500523-98ae696c47f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
      publishedAt: map['pubDate'] != null
          ? map['publishedAt'] as String
          : "publishedAt Null",
      content:
          map['content'] != null ? map['content'] as String : "content Null",
    );
    //print(arc.urlToImage);
    return arc;
  }
}
