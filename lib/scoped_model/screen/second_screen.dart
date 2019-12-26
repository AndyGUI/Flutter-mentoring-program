import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/scoped_model/model/counter_model.dart';
import 'package:flutter_mentoring_programm/scoped_model/screen/third_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic arch -> Second screen"),
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
                child: Text("Go to 3rd screen"),
                onPressed: () => Navigator.of(context).push<int>(
                      CupertinoPageRoute(builder: (ctx) => ThirdScreen()),
                    )),
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
            onPressed: () => CounterModel.of(context).add2ToCounter(),
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
            onPressed: () => CounterModel.of(context).multiplyBy2Counter(),
          ),
        ],
      ),
    );
  }
}
