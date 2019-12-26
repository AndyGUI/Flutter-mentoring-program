import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/redux/module/counter/counter_actions.dart';
import 'package:flutter_mentoring_programm/redux/redux/app_store.dart';
import 'package:flutter_mentoring_programm/redux/screen/second_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppStore, _CounterScreenViewModel>(
      converter: (store) => _CounterScreenViewModel(store),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text("Redux arch -> First screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              Text(
                '${viewModel.count ?? 0}',
                style: Theme.of(context).textTheme.display1,
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
          onPressed: () => viewModel.increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _CounterScreenViewModel {
  final Store<AppStore> store;
  final int count;

  _CounterScreenViewModel(this.store) : count = store.state.counter.count;

  void increment() {
    store.dispatch(CounterIncrementAction());
  }
}
