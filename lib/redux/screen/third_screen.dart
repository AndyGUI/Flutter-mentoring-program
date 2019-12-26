import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/redux/module/counter/counter_actions.dart';
import 'package:flutter_mentoring_programm/redux/redux/app_store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppStore, _CounterScreenViewModel>(
      converter: (store) => _CounterScreenViewModel(store),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text("Redux arch -> Third screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${viewModel.count ?? 0}',
                style: Theme.of(context).textTheme.display1,
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
          onPressed: () => viewModel.subtract7FromCounter(),
        ),
      ),
    );
  }
}

class _CounterScreenViewModel {
  final Store<AppStore> store;
  final int count;

  _CounterScreenViewModel(this.store) : count = store.state.counter.count;

  void subtract7FromCounter() {
    store.dispatch(CounterSubtract7Action());
  }
}
