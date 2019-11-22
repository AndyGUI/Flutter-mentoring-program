import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Future Builder Widget',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      margin: EdgeInsets.only(right: 48),
    );
  }
}
