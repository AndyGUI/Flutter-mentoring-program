import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/inherited_model/screen/second_screen.dart';
import 'package:flutter_mentoring_programm/inherited_model/state/counter_model.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final state = CounterStateContainer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited_model arch -> First screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${state.counterState.counter ?? 0}',
              style: Theme.of(context).textTheme.display1,
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
        onPressed: () =>  state.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
