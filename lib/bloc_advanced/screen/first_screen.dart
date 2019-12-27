import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/counter/count_evens.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/counter/counter_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/screen/second_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advanced bloc arch -> First screen"),
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
        onPressed: () =>
            BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
