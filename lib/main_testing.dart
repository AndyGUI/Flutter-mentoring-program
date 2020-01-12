import 'package:flutter/material.dart';

import 'field_validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final formKey = GlobalKey<FormState>();

  String _formattedText = "";

  final inputFieldController = TextEditingController();

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _formattedText = inputFieldController.value.text;
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter testing demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildWidgets(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWidgets() => <Widget>[
        TextFormField(
          controller: inputFieldController,
          key: Key('textInput'),
          decoration: InputDecoration(labelText: 'Input text here'),
          validator: validateInput,
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          key: Key('rePrint'),
          child: Text('Re-print', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSave,
        ),
        SizedBox(
          height: 20,
        ),
        Text(_formattedText.toUpperCase()),
      ];

  @override
  void dispose() {
    inputFieldController.dispose();
    super.dispose();
  }
}
