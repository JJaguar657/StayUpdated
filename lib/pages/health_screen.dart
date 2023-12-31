import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../services/services_api.dart';
import '../view_model/article_view_model.dart';
import '../view_model/article_cat.dart';
import 'page_article.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);
  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  var articlesListViewModel = ArticlesListViewModel(classRepository: NewsApi());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleViewModel>>(
      future: articlesListViewModel.fetchNewsGeneral(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              color: Colors.transparent,
              child: SizedBox(
                  child: CircularProgressIndicator(), height: 200, width: 200));
        } else {
          var news = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.black,
            body: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailsScreen(
                          //  sourceName: news[index]!.sourceName,
                          title: news[index].title,
                          author: news[index].author,
                          publishedAt: news[index].publishedAt,
                          description: news[index].description,
                          content: news[index].content,
                          urlToImage: news[index].urlToImage,
                          url: news[index].url,
                        ),
                      ),
                    );
                  }),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35.0),
                            topRight: Radius.circular(35.0),
                            bottomLeft: Radius.circular(35.0),
                            bottomRight: Radius.circular(35.0),
                          ),
                          child: Image.network(
                            news[index].urlToImage,
                            fit: BoxFit.fill,
                            height: 300.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 300.0, 0.0, 0),
                        child: Container(
                          height: 200.0,
                          width: 750.0,
                          child: Material(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(35.0),
                            elevation: 10.0,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Text(
                                    news[index].title,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xfff8f7ff)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: news == null ? 0 : news.length,
              viewportFraction: 0.7,
              scale: 0.9,
              autoplay: true,
            ),
          );
        }
      },
    );
  }
}
