import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/moor_slidable/with_dao/moor_database_with_dao.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // The single instance of AppDatabase
//      create: (_) => AppDatabase(),
      create: (_) => AppDatabase().taskDao,
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}