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
        body: SafeArea(child: NewWidget()),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            child: Text("Alert dialog"),
            onPressed: () => _showAlertDialog(context),
          ),
          RaisedButton(
            child: Text("iOS dialog"),
            onPressed: () => _showCupertinoAlertDialog(context),
          ),
          RaisedButton(
            child: Text("Custom dialog"),
            onPressed: () => _showCustomDialog(context),
          ),
          RaisedButton(
            child: Text("FullScren dialog"),
            onPressed: () => _showFullScreenDialog(context),
          ),
          RaisedButton(
            child: Text("Snackbar simple"),
            onPressed: () => _showSnackBar(context),
          ),
          RaisedButton(
            child: Text("Snackbar with action"),
            onPressed: () => _showSnackBarWithAction(context),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert Dialog title"),
          content: Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoAlertDialog(context) {
    // flutter defined function
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: Text("Alert Dialog title"),
          content: Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("100% Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCustomDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What do you want to remember?'),
                  SizedBox(
                    width: 320.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Get it!",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFullScreenDialog(context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Scaffold(
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 24),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      iconSize: 32,
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 200,
//                    width: 200,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 200,
//                    width: 200,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showSnackBar(context) {
    final snackBar = SnackBar(content: Text('Simple snachbar, no actions'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _showSnackBarWithAction(context) {
    final snackBar = SnackBar(
      content: Text('Simple snachbar, no actions'),
      duration: Duration(milliseconds: 800),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Provide some code to handle action
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
