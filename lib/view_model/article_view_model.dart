import '/model/model_article.dart';

class ArticleViewModel {
  Article? articleModel;
  ArticleViewModel({
    this.articleModel,
  });
  get title => articleModel?.title;
  get author => articleModel?.author;
  get publishedAt => articleModel?.publishedAt;
  get description => articleModel?.description;
  get content => articleModel?.content;
  get urlToImage => articleModel?.urlToImage;
  get url => articleModel?.url;
}
