import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flushbar Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MainWidget('FlushBar Demo'),
    );
  }
}

class MainWidget extends StatefulWidget {
  final String title;

  MainWidget(this.title);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  Flushbar flush;
  bool _wasButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
              child: Text("Press me for simple snackBar"),
              onPressed: _showSimpleSnackBar,
            ),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
              child: Text("Press me for crazy snackBar"),
              onPressed: _showCrazySnackBar,
            ),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
              child: Text("Press me for Simple Rounded snackBar"),
              onPressed: _showSimpleRoundedSnackBar,
            ),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
              child: Text("Press me for simple with indicator snackBar"),
              onPressed: _showSimpleWithIndicatorSnackBar,
            ),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
              child: Text("Press me for with gradient snackBar"),
              onPressed: _showSimpleWithGradientSnackBar,
            ),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
              child: Text("Press me for cool snackBar"),
              onPressed: _showSimpleWithGradientSnackBar,
            ),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
              child: Text("Press me for custom not dismissed snackBar"),
              onPressed: _showCustomSnackBar,
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  _showSimpleSnackBar() => Flushbar(
        title: "Hey Ninja",
        message:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        duration: Duration(seconds: 3),
      )..show(context);

  _showSimpleRoundedSnackBar() => Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        title: "Hey Ninja",
        message:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        duration: Duration(seconds: 2),
      )..show(context);

  _showSimpleWithIndicatorSnackBar() => Flushbar(
        message:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.blue[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.blue[300],
      )..show(context);

  _showSimpleWithGradientSnackBar() => Flushbar(
        title: "Hey Ninja",
        message:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        backgroundGradient: LinearGradient(
          colors: [Colors.teal, Colors.lightBlue],
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
        boxShadows: [
          BoxShadow(
            color: Colors.blue[800],
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0,
          )
        ],
      )..show(context);

  _showCrazySnackBar() => Flushbar(
        title: "Hey Ninja",
        message:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        boxShadows: [
          BoxShadow(
              color: Colors.blue[800],
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0)
        ],
        backgroundGradient:
            LinearGradient(colors: [Colors.blueGrey, Colors.black]),
        isDismissible: false,
        duration: Duration(seconds: 4),
        icon: Icon(
          Icons.check,
          color: Colors.greenAccent,
        ),
        mainButton: FlatButton(
          onPressed: () {},
          child: Text(
            "CLAP",
            style: TextStyle(color: Colors.amber),
          ),
        ),
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: Colors.blueGrey,
        titleText: Text(
          "Hello Hero",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.yellow[600],
              fontFamily: "ShadowsIntoLightTwo"),
        ),
        messageText: Text(
          "You killed that giant monster in the city. Congratulations!",
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.green,
              fontFamily: "ShadowsIntoLightTwo"),
        ),
      )..show(context);

  _showCustomSnackBar() => flush = Flushbar<bool>(
        title: "Hey Ninja",
        message:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        icon: Icon(
          Icons.info_outline,
          color: Colors.blue,
        ),
        mainButton: FlatButton(
          onPressed: () {
            flush.dismiss(true); // result = true
          },
          child: Text(
            "ADD",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ) // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
        ..show(context).then((result) {
          setState(() {
            // setState() is optional here
            _wasButtonClicked = result;
          });
        });
}
