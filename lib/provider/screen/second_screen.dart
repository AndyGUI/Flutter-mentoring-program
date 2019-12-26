import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/provider/screen/third_screen.dart';
import 'package:flutter_mentoring_programm/provider/state/counter_state.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic arch -> Second screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '${state.counter ?? 0}',
              style: Theme.of(context).textTheme.display1,
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
            onPressed: () => state.add2ToCounter(),
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
            onPressed: () => state.multiplyBy2Counter(),
          ),
        ],
      ),
    );
  }
}
