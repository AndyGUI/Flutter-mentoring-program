import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(helloWorldSimple());

Widget helloWorldSimple() => Text(
      "Hello, world!",
      textDirection: TextDirection.ltr,
    );

Widget helloWorldCentred() => Center(
      child: Text(
        "Hello, world!",
        textDirection: TextDirection.ltr,
      ),
    );

Widget helloWorldColoredContainer() => Container(
      color: Colors.grey,
      child: Center(
        child: Text(
          "Hello, world!",
          textDirection: TextDirection.ltr,
        ),
      ),
    );

Widget helloWorldColoredTextAndContainer() => Container(
      color: Colors.grey,
      child: Center(
        child: Text(
          "Hello, world!",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow),
        ),
      ),
    );

Widget helloWorldColoredContainerAndStyledText() => Container(
      color: Colors.grey,
      child: Center(
        child: Text(
          "Hello, world!",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 45,
            fontStyle: FontStyle.italic,
            backgroundColor: Colors.black,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dashed,
            letterSpacing: 12,
          ),
        ),
      ),
    );
