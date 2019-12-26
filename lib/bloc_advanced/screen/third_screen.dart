import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/counter'
    '/count_evens.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/counter'
    '/counter_model.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/theme/theme_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/theme/theme_evens.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advanced bloc arch -> Third screen"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
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
                SizedBox(
                  height: 100,
                ),
                CupertinoButton(
                  child: Text("Another theme?"),
                  onPressed: () => BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeEvent.toggle),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FlatButton.icon(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.red)),
        color: Colors.red,
        icon: Text(" - "),
        label: Text('Subtract 7 '),
        onPressed: () =>
            BlocProvider.of<CounterBloc>(context).add(CounterSubtract7Event()),
      ),
    );
  }
}
