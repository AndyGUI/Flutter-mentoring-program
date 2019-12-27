import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/provider/screen/first_screen.dart';
import 'package:flutter_mentoring_programm/provider/state/counter_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      /// For single provider use Provider<T>()
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Counter>(
            create: (_) => Counter(),
          ),

          /// Can be add more providers.
          ///    Provider<Counter>(create: (_) => Counter()),
          ///    Provider<Counter>(create: (_) => Counter()),
        ],
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
