import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/basic_framework/screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic arch -> First screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter ?? 0}',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.cyanAccent[100],
              child: Text("Go to 2nd screen"),
              onPressed: () async {
                final result = await Navigator.of(context).push<int>(
                  MaterialPageRoute(builder: (ctx) => SecondScreen(_counter)),
                );
                if (result != null) _updateCounter(result);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _updateCounter(int result) {
    setState(() {
      _counter = result;
    });
  }
}
