import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final ourGlobalKey = GlobalKey<MyStatefulWidget1State>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MyStatefulWidget1(key: ourGlobalKey),
            MyStatefulWidget2(),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget1 extends StatefulWidget {
  MyStatefulWidget1({Key key}) : super(key: key);

  State createState() => MyStatefulWidget1State();
}

class MyStatefulWidget1State extends State<MyStatefulWidget1> {
  String _createdObject = "Hello world!";

  String get createdObject => _createdObject;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_createdObject),
    );
  }
}

class MyStatefulWidget2 extends StatefulWidget {
  State createState() => MyStatefulWidget2State();
}

class MyStatefulWidget2State extends State<MyStatefulWidget2> {
  String _text = 'PRESS ME';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(_text),
        onPressed: () {
          setState(() {
            _text = ourGlobalKey.currentState.createdObject;
          });
        },
      ),
    );
  }
}
