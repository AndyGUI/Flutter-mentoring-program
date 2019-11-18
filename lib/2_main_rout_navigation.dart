import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialogs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        '/second': (BuildContext context) => SecondPage(),
        '/third': (BuildContext context) => ThirdPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitApp(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
        ),
        body: Container(
          color: Colors.cyanAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "1st screen",
                  style: TextStyle(fontSize: 60),
                ),
                SizedBox(height: 20),
                CupertinoButton(
                  color: Colors.cyanAccent[100],
                  child: Text("Go to 2nd screen"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "2nd screen",
                style: TextStyle(fontSize: 60),
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: Colors.cyanAccent[100],
                child: Text("Go to 3rd screen"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third page"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "3rd screen",
                style: TextStyle(fontSize: 60),
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: Colors.greenAccent[700],
                child: Text("Go to 2rd screen"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: Colors.cyanAccent[400],
                child: Text("Go to 1st screen"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
