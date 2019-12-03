import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Module 7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: NewWidget(),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: isPortrait
          ? Column(
              children: _itemsChildren(),
            )
          : Row(children: _itemsChildren()),
    );
  }

  _colorChildren() => [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blueAccent,
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Container(
            color: Colors.yellowAccent,
          ),
        ),
        Flexible(
          flex: 3,
          child: Center(child: Text("Test")),
        ),
      ];

  _itemsChildren() => [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
            height: 200,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
            height: 200,
            width: 100,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.red,
            height: 200,
            width: 100,
          ),
        ),
      ];
}
