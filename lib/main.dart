import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SafeAreaWidget(),
                WrapWidget(),
                RichTextWidget(),
                MediaQueryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SafeAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        'You have pushed the button this many times:',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 44,
        margin: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        color: Colors.grey[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(Icons.verified_user),
              ),
            ),
            Wrap(
              children: <Widget>[
                CustomChip(Icon(Icons.delete), "Press me"),
                CustomChip(Icon(Icons.close), "Or me"),
                CustomChip(Icon(Icons.closed_caption), "Better -> me"),
                CustomChip(Icon(Icons.add_circle), "Press me"),
                CustomChip(Icon(Icons.add_circle), "1"),
                CustomChip(Icon(Icons.add_circle), "2"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: 'You have to say ',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 22,
          ),
          children: [
            TextSpan(
              text: "'What's up!'",
              recognizer: TapGestureRecognizer()
                ..onTap = () => showAboutDialog(
                      applicationIcon: Icon(Icons.add_circle),
                      context: context,
                      applicationLegalese: "License....",
                    ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: ", dude :)",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                  letterSpacing: 5),
            ),
          ],
        ),
      ),
    );
  }
}

class MediaQueryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    final TAG = "MediaQuery";

    print("$TAG $size");
    print("$TAG contains 0*0 ${size.contains(Offset(0.0, 0.0))}");
    print("$TAG contains 900*900 ${size.contains(
      Offset(900.0, 900.0),
    )}");

    if (orientation == Orientation.portrait) {
      return _portrait(size);
    }
    return _landscape(size);
  }

  SizedBox _landscape(Size size) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          childAspectRatio: 3,
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: getItems(size.width / 2.2),
        ),
      ),
    );
  }

  Align _portrait(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: getItems(size.width / 2.2),
      ),
    );
  }

  List<Widget> getItems(width) => [
        SizedBox(
          height: 50,
          width: width,
          child: Card(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'You and I',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: width,
          child: Card(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'You and I 2',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: width,
          child: Card(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'You and I 3 ',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: width,
          child: Card(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'You and I 4 ',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: width,
          child: Card(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You and I 5 ',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        ...List.generate(20, (i) => i).map(
          (index) => Card(
            color: Colors.green,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Number $index ',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ];
}

class CustomChip extends StatelessWidget {
  final Icon icon;
  final String label;

  const CustomChip(
    this.icon,
    this.label,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        padding: EdgeInsets.all(4.0),
        onDeleted: () {},
        deleteIcon: icon,
        label: Text(
          label,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
