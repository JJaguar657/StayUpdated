import 'package:stayupdated/model/model_article.dart';

abstract class ClassRepository {
  Future<List<Article>> getAllNews();
  Future<List<Article>> getCategory(String category);
}
