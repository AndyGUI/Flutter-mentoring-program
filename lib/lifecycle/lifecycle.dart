import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: periodicStream(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage(snapshot.data);
          }
          return MyHomePage(0);
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int data;

  MyHomePage(this.data);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;

  _MyHomePageState();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    print('HomePageState -> initState');
  }

  @override
  void dispose() {
    print('HomePageState -> dispose');

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('HomePageState -> state = $state');
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    print('HomePageState -> didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('HomePageState -> build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecyle"),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${widget.data}',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _counter++;
        }),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

periodicStream() => Stream.periodic(Duration(seconds: 2), (i) => i);
