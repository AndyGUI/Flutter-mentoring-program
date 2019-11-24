import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/http/page/post_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostsPage(),
    );
  }
}
