import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/redux/redux/app_store.dart';
import 'package:flutter_mentoring_programm/redux/redux/middle_ware.dart';
import 'package:flutter_mentoring_programm/redux/redux/reducer.dart';
import 'package:flutter_mentoring_programm/redux/screen/first_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppStore>(
    appReducer,
    initialState: AppStore.initial(),
    middleware: [epicMiddleware],
  );

  runApp(MyApp(store));
}

final scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  final Store<AppStore> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppStore>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.grey),
          home: Scaffold(
            body: Builder(builder: (ctx) => FirstScreen()),
            key: scaffoldKey,
          ),
        ));
  }
}
