import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_provider/src/search/search_notifier.dart';
import 'package:search_provider/src/search/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider.value(
        value: SearchNotifier(),
        child: SearchPage(),
      ),
    );
  }
}
