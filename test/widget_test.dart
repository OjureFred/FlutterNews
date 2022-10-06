import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutternews/article.dart';

import 'package:flutternews/main.dart';
import 'package:flutternews/news_change_notifier.dart';
import 'package:flutternews/news_service.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsService extends Mock implements NewsService {
  @override
  Future<List<Article>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }
 }

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;

  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsChangeNotifier(NewsService());
  });

  test(
    'Initial values are correct',
      () {
      expect(sut.articles, []);
      expect(sut.isLoading, false);
  }
  );
}