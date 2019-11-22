import 'dart:convert';

import 'package:http/http.dart' as http;

Future<int> get waitForMe async =>
    await Future.delayed(Duration(microseconds: 333), () => 333);

void main() async {
  print(await waitForMe);

  try {
    final result =
        await http.get("https://jsonplaceholder.typicode.com/todos/1");
  } catch (e) {
    print('Some bad thing is heppened => $e');
  }

  try {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/todos/1");

    final someDataFromCall = json.decode(response.body)["id"];

    final response2 = await http
        .get("https://jsonplaceholder.typicode.com/todos/$someDataFromCall");
    print('Response 1 => ${response.body.toUpperCase()} \n');
    print('Response 2 => ${response2.body.toLowerCase()} \n');
  } catch (e) {
    print('Some bad thing is heppened => $e');
  }

  try {
    final callOne = http.get("https://jsonplaceholder.typicode.com/todos/1");

    final callTwo = http.get("https://jsonplaceholder.typicode.com/todos/2");

    await Future.wait([callOne, callTwo]);

    print('Kinda ZIP operator');

    /// At this point will have a data
  } catch (e) {
    print('Some bad thing is heppened => $e');
  }
}
