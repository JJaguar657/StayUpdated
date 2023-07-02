import 'package:http/http.dart';
import 'dart:convert';
import 'package:stayupdated/model/model_article.dart';
import 'package:stayupdated/services/classRepository.dart';
import 'package:stayupdated/model/article_list_model.dart';

class NewsApi extends ClassRepository {
  @override
  Future<List<Article>> getAllNews() async {
    try {
      var uri = Uri.parse('https://newsdata2.p.rapidapi.com/news?language=en');
      Response res = await get(uri, headers: {
        'X-RapidAPI-Key': '3c9d8625d5msh9b065a8fea6695cp1a5802jsn039374f69114',
        'X-RapidAPI-Host': 'newsdata2.p.rapidapi.com'
      });
      print(res.statusCode);
      if (res.statusCode == 200) {
        String data = res.body;
        var json = jsonDecode(data);
        List _articles = [];
        //print("s");
        for (var i in json['results']) {
          _articles.add(i);
        }

        return Article.articleFromSnapshot(_articles);
      }
    } catch (e) {}
    throw Exception("status");
  }

  @override
  Future<List<Article>> getCategory(String category) async {
    try {
      var uri = Uri.parse(
          'https://newsdata2.p.rapidapi.com/news?category=$category&language=en');
      Response res = await get(uri, headers: {
        'X-RapidAPI-Key': '3c9d8625d5msh9b065a8fea6695cp1a5802jsn039374f69114',
        'X-RapidAPI-Host': 'newsdata2.p.rapidapi.com'
      });
      if (res.statusCode == 200) {
        String data = res.body;
        var json = jsonDecode(data);
        List _articles = [];
        //print("s");
        for (var i in json['results']) {
          _articles.add(i);
        }

        return Article.articleFromSnapshot(_articles);
      } else {
        // here shacked number status code
        // ignore: avoid_print
        print("status code#Amer# = ${res.statusCode}");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    throw Exception("status");
  }
}
