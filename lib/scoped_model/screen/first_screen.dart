import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/scoped_model/model/counter_model.dart';
import 'package:flutter_mentoring_programm/scoped_model/screen/second_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoped_model arch -> First screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) => Text(
                '${model.counter ?? 0}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.cyanAccent[100],
              child: Text("Go to 2nd screen"),
              onPressed: () {
                Navigator.of(context).push<int>(
                  CupertinoPageRoute(builder: (ctx) => SecondScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => CounterModel.of(context).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
