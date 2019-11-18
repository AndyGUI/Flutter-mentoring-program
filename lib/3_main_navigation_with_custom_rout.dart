import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/dialogs.dart';

import 'custom_routs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomePage(),
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
                Text('First screen ;) '),
                SizedBox(height: 20),
                CupertinoButton(
                  color: Colors.cyanAccent[100],
                  child: Text("Go to 2nd screen"),
                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (_) => SecondPage()),
//                    );
                    Navigator.push(
                        context,
                        SlideRightRoute(
                          page: SecondPage(),
                        ));
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
              Text('Second screen *) '),
              SizedBox(height: 20),
              CupertinoButton(
                color: Colors.cyanAccent[100],
                child: Text("Go to 3rd screen"),
                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (_) => ThirdPage()),
//                  );
                  Navigator.push(context, SlideRightRoute(page: ThirdPage()));
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
              Text('Third screen *) '),
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
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
