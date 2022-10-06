import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutternews/news_change_notifier.dart';
import 'package:flutternews/news_page.dart';
import 'package:flutternews/news_service.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      home: ChangeNotifierProvider (
        create: (_) => NewsChangeNotifier(NewsService()),
        child: NewsPage(),
      ),
    );
  }
}

