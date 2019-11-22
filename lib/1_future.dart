import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  // Future<dynamic>
  final willBeNull = Future.delayed(Duration(milliseconds: 500));
  print("Printing willBeNull future value =>$willBeNull");

  Future.delayed(
    Duration(milliseconds: 500),
    () => print("Printing after delay 500ms!\n"),
  );

  Future.value(42).catchError(
    (e) => print('No chance to get error'),
  );

  Future.value(42).whenComplete(
    () => print('Printing when complite\n'),
  );

  final Future myFancyFuture =
      http.get('https://jsonplaceholder.typicode.com/todos/1');

  myFancyFuture
      .then(
        (response) => print('ID is => ' + json.decode(response.body)["id"]),
      )
      .catchError((e) => print('Ou, nooooooo...\n'))
      .whenComplete(() => print("Complite FANCY\n"));

  http
      .get("https://jsonplaceholder.typicode.com/todos/1")
      .then((response) => print(response.body))
      .then((v) => http.get("https://jsonplaceholder.typicode.com/todos/1"))
      .then((response) => print("Here is a second body => ${response.body}"))
      .then((v) => http.get("https://jsonplacolder.typicode.com/todos/2"))
      .then((response) => print(response))
      .catchError((e) => print(e.toString()))
      .whenComplete(() => print("Complite LAST BLOCK \n"));
}
