import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/basic_framework/screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final int initCount;

  SecondScreen(this.initCount);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
          title: Text("Scoped_model arch -> Second screen"),
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
              SizedBox(height: 20),
              CupertinoButton(
                color: Colors.cyanAccent[100],
                child: Text("Go to 3rd screen"),
                onPressed: () async {
                  final result = await Navigator.of(context).push<int>(
                    MaterialPageRoute(builder: (ctx) => ThirdScreen(_counter)),
                  );
                  if (result != null) _updateCounter(result);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.red,
              icon: Icon(Icons.add),
              label: Text('Add 2 '),
              onPressed: _add2ToCounter,
            ),
            SizedBox(
              width: 24,
            ),
            FlatButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.red,
              icon: Icon(Icons.close),
              label: Text('Multiply by 2 '),
              onPressed: _multiplyBy2Counter,
            ),
          ],
        ),
      ),
    );
  }

  void _updateCounter(int result) {
    setState(() {
      _counter = result;
    });
  }

  void _add2ToCounter() {
    setState(() {
      _counter += 2;
    });
  }

  void _multiplyBy2Counter() {
    setState(() {
      _counter *= 2;
    });
  }
}
