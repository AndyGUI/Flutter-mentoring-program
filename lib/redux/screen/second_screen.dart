import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/redux/module/counter/counter_actions.dart';
import 'package:flutter_mentoring_programm/redux/redux/app_store.dart';
import 'package:flutter_mentoring_programm/redux/screen/third_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppStore, _CounterScreenViewModel>(
      converter: (store) => _CounterScreenViewModel(store),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text("Redux arch -> Second screen"),
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
              onPressed: () => viewModel.add2ToCounter(),
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
              onPressed: () => viewModel.multiplyBy2Counter(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterScreenViewModel {
  final Store<AppStore> store;
  final int count;

  _CounterScreenViewModel(this.store) : count = store.state.counter.count;

  void multiplyBy2Counter() {
    store.dispatch(CounterMultiplyBy2Action());
  }

  void add2ToCounter() {
    store.dispatch(CounterIncrementBy2Action());
  }
}
