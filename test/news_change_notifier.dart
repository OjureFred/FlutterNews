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

  group('getArticles', (){
    final articlesFromService = [
      Article(title: 'Test 1', content: 'Test 1 content'),
      Article(title: 'Test 2', content: 'Test 2 content'),
      Article(title: 'Test 3', content: 'Test 3 content'),
    ];
    void arrangeNewsServiceReturns3Articles() {
      when(() => mockNewsService.getArticles()).thenAnswer(
              (_) async => articlesFromService);
    }
    test(
      'gets articles using NewsService',
        () async {
        arrangeNewsServiceReturns3Articles();
        await sut.getArticles();
        verify(()=> mockNewsService.getArticles()).called(1);
        }
    );
    test(
      """ indicates loading data, sets articles to the ones from the service,
      indicates that data is not being loaded anymore""",
        () async {
            arrangeNewsServiceReturns3Articles();
            final future = sut.getArticles();
            expect(sut.isLoading, true);
            await future;
            expect(sut.articles, articlesFromService);
            expect(sut.isLoading, false);
        }
    );
  });
}