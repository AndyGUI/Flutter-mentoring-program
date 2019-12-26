import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/bloc_pure/bloc/counter/count_evens.dart';
import 'package:flutter_mentoring_programm/bloc_pure/bloc/counter/counter_model.dart';
import 'package:flutter_mentoring_programm/bloc_pure/screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pure bloc arch -> Second screen"),
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
            onPressed: () =>
                _bloc.counterEventSink.add(CounterIncrementBy2Event()),
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
            onPressed: () =>
                _bloc.counterEventSink.add(CounterMultiplyBy2Event()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
