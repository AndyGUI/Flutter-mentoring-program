import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Gestures';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Center(child: InkWellWidget()),
      ),
    );
  }
}

class GesturesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text("TOUCH IT"),
      onTap: () => print("GESTURES => TAP"),
      onDoubleTap: () => print("GESTURES => DOUBLE TAP"),
      onLongPress: () => print("GESTURES => LOGNPRESSED"),
      onHorizontalDragUpdate: (details) => print("GESTURES => DRAG UPDATE "
          "X-${details.globalPosition.dx}"
          "Y-${details.globalPosition.dy}"),
    );
  }
}

class InkWellWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () => showAboutDialog(
        context: context,
      ),
      borderRadius: BorderRadius.all(Radius.circular(22)),
      splashColor: Colors.cyan,
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Tap'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}
