import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

/// NSUserDefaults (on iOS) and SharedPreferences (on Android),
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    _incrementCounterInStore();
    setState(() {
      _counter++;
    });
  }

  _incrementCounterInStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (ctx, snapShot) {
                if (snapShot.hasData) {
                  _counter = snapShot.data.getInt("counter") ?? 0;
                }
                return Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: () => _launchURL('https://flutter.dev'),
              child: Text('Show Flutter homepage (by URL)'),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: () => _launchURL('tel:+3 809 591 315 58'),
              child: Text('Use phone'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//  tel:+380959131558
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
