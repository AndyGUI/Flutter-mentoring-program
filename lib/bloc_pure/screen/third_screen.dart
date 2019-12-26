import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/bloc_pure/bloc/counter/count_evens.dart';
import 'package:flutter_mentoring_programm/bloc_pure/bloc/counter/counter_model.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pure bloc arch -> Third screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: StreamBuilder(
                stream: _bloc.counter,
                initialData: _bloc.initState,
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
        onPressed: () => _bloc.counterEventSink.add(CounterSubtract7Event()),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
