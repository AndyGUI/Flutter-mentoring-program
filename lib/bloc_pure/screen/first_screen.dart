import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/bloc_pure/bloc/counter/count_evens'
    '.dart';
import 'package:flutter_mentoring_programm/bloc_pure/bloc/counter/counter_model.dart';
import 'package:flutter_mentoring_programm/bloc_pure/screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pure bloc arch -> First screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: StreamBuilder(
                stream: _bloc.counter,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                  );
                },
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
        onPressed: () => _bloc.counterEventSink.add(CounterIncrementEvent()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
//
//    _bloc.dispose();
    super.dispose();
  }
}
