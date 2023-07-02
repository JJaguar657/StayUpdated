import 'package:stayupdated/model/model_article.dart';
import 'package:stayupdated/services/classRepository.dart';
import '/view_model/article_view_model.dart';

class ArticlesListViewModel {
  ClassRepository? classRepository;
  ArticlesListViewModel({
    this.classRepository,
  });
  Future<List<ArticleViewModel>> fetchAllNews() async {
    List<Article> list = await classRepository!.getAllNews();
    return list.map((e) => ArticleViewModel(articleModel: e)).toList();
  }

  Future<List<ArticleViewModel>> fetchNewsHealth() async {
    List<Article> list = await classRepository!.getCategory("health");
    return list.map((e) => ArticleViewModel(articleModel: e)).toList();
  }

  Future<List<ArticleViewModel>> fetchNewsGeneral() async {
    List<Article> list = await classRepository!.getCategory("business");
    return list.map((e) => ArticleViewModel(articleModel: e)).toList();
  }

  Future<List<ArticleViewModel>> fetchNewsTechnology() async {
    List<Article> list = await classRepository!.getCategory("technology");
    return list.map((e) => ArticleViewModel(articleModel: e)).toList();
  }

  Future<List<ArticleViewModel>> fetchNewsScience() async {
    List<Article> list = await classRepository!.getCategory("science");
    return list.map((e) => ArticleViewModel(articleModel: e)).toList();
  }
}
