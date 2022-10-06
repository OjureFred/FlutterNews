import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutternews/article.dart';

//A News Service simulating commnication with server
class NewsService {
  //Simulating a remote database
  final _articles = List.generate(
      10,
      (_) => Article(
        title: lorem(paragraphs: 1, words: 3),
        content: lorem(paragraphs: 10, words: 500),
      )
      );

  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(seconds: 1));
    return _articles;
  }

}