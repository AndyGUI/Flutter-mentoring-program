import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> exitApp(BuildContext context) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Do you want to exit this application?'),
          content: Text('We hate to see you leave...'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        );
      },
    ) ??
    false;

Future<bool> showAlertWithData(BuildContext context, data) =>
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Hey!'),
        content: Text("Data is ${data.toString()}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes, dude!'),
          ),
        ],
      ),
    ) ??
    false;
