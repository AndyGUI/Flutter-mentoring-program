import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/scoped_model/model/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic arch -> Third screen"),
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
        onPressed: () => CounterModel.of(context).subtract7FromCounter(),
      ),
    );
  }
}
