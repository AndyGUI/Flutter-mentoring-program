import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/flutter_spinkit/show_case.dart';
import 'package:flutter_mentoring_programm/flutter_spinkit/work_space.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                child: LayoutBuilder(
                  builder: (context, _) {
                    return IconButton(
                      icon: Icon(Icons.play_circle_filled),
                      iconSize: 50.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ShowCase(),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                    );
                  },
                ),
                alignment: Alignment.bottomCenter,
              ),
              Positioned.fill(
                child: Center(
                  child: WorkSpace(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
