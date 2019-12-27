import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/inherited_model/screen/first_screen.dart';
import 'package:flutter_mentoring_programm/inherited_model/state/counter_model.dart';

void main() => runApp(
      CounterStateContainer(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: FirstScreen(),
    );
  }
}
