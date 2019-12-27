import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/counter/count_evens.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/counter/counter_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/screen/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advanced bloc arch -> Second screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$count',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                );
              },
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
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            color: Colors.red,
            icon: Icon(Icons.add),
            label: Text('Add 2 '),
            onPressed: () => BlocProvider.of<CounterBloc>(context)
                .add(CounterIncrementBy2Event()),
          ),
          SizedBox(
            width: 24,
          ),
          FlatButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            color: Colors.red,
            icon: Icon(Icons.close),
            label: Text('Multiply by 2 '),
            onPressed: () => BlocProvider.of<CounterBloc>(context)
                .add(CounterMultiplyBy2Event()),
          ),
        ],
      ),
    );
  }
}
