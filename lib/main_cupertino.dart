import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            title: Text("User"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text("Menu"),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(color: Colors.yellow);
        } else if (index == 1) {
          return Container(color: Colors.black);
        } else {
          return Container(color: Colors.red);
        }
      },
    );
  }
}
