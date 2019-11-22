import 'package:flutter/material.dart';

import 'app_bar_title.dart';
import 'content.dart';
import 'demo.dart';

void main() => runApp(
      FutureBuilderApp(),
    );

class FutureBuilderApp extends StatefulWidget {
  @override
  _FutureBuilderAppState createState() => _FutureBuilderAppState();
}

class _FutureBuilderAppState extends State<FutureBuilderApp> {
  bool _isButtonClicked = false;
  var _buttonIcon = Icons.cloud_download;
  var _buttonText = "Fetch Data";
  var _buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(),
        ),
        body: ContentItemBuilder(_isButtonClicked),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: buildFloatingActionButton(),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() =>
      FloatingActionButton.extended(
        backgroundColor: _buttonColor,
        onPressed: () {
          ///Calling method to fetch data from the server
          getMockData();

          ///You need to reset UI by calling setState.
          setState(() {
            _isButtonClicked = !_isButtonClicked;
            if (!_isButtonClicked) {
              _buttonIcon = Icons.cloud_download;
              _buttonColor = Colors.green;
              _buttonText = "Fetch Data";
            } else {
              _buttonIcon = Icons.replay;
              _buttonColor = Colors.deepOrange;
              _buttonText = "Reset";
            }
          });
        },
        icon: Icon(
          _buttonIcon,
          color: Colors.white,
        ),
        label: Text(
          _buttonText,
          style: TextStyle(color: Colors.white),
        ),
      );
}
