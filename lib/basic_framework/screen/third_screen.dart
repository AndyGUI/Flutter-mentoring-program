import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  final int initCount;

  ThirdScreen(this.initCount);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _counter;

  @override
  void initState() {
    _counter = widget.initCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(_counter);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Scoped_model arch -> Third screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FlatButton.icon(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)),
          color: Colors.red,
          icon: Text(" - "),
          label: Text('Subtract 7 '),
          onPressed: _subtract7FromCounter,
        ),
      ),
    );
  }

  void _subtract7FromCounter() {
    setState(() {
      _counter -= 7;
    });
  }
}
