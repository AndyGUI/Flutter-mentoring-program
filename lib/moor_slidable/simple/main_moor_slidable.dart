import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'moor_database.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // The single instance of AppDatabase
      create: (_) => AppDatabase(),
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}