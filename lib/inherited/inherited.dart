import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/inherited/state_container.dart';

import 'form_page.dart';

void main() {
  runApp(StateContainer(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Some Todos',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  User user;

  Widget get _userInfo {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("${user?.firstName} ${user?.lastName}",
              style: TextStyle(fontSize: 24.0)),
          Text(user?.email ?? "Hurma", style: TextStyle(fontSize: 24.0)),
        ],
      ),
    );
  }

  Widget get _logInPrompt {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Please add user information'),
        ],
      ),
    );
  }

  void _updateUser(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return UpdateUserScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    user = container.user;
    var body = user != null ? _userInfo : _logInPrompt;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget Test'),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: Icon(Icons.edit),
      ),
    );
  }
}
