import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/inherited_model/state/counter_model.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = CounterStateContainer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited_model  -> Third screen"),
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
        onPressed: () => state.subtract7FromCounter(),
      ),
    );
  }
}
