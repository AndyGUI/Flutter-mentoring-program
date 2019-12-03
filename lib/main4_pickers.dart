import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoExample());
}

class CupertinoExample extends StatefulWidget {
  @override
  _CupertinoExampleState createState() => _CupertinoExampleState();
}

class _CupertinoExampleState extends State<CupertinoExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ExamplePage());
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  DateTime _setDate = DateTime.now();
  Duration initialtimer = Duration();
  int selectitem = 1;

  Widget datetime() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
      },
      use24hFormat: true,
      maximumDate: DateTime(2021, 12, 30),
      minimumYear: 2010,
      maximumYear: 2021,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.dateAndTime,
    );
  }

  Widget time() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text(
                  "Cupertino date Picker",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.redAccent,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                            height:
                                MediaQuery.of(context).copyWith().size.height /
                                    3,
                            child: datetime());
                      });
                },
              ),
              MaterialButton(
                child: Text("Cupertino"),
                color: Colors.greenAccent,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                            height:
                                MediaQuery.of(context).copyWith().size.height /
                                    3,
                            child: time());
                      });
                },
              ),
              MaterialButton(
                child: Text("CustomPicker"),
                color: Colors.blueAccent,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Scaffold(
                            appBar: AppBar(
                              title: Text(
                                "CupertinoPicker",
                                textAlign: TextAlign.justify,
                              ),
                              backgroundColor: Colors.teal,
                              actions: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {},
                                )
                              ],
                            ),
                            body: Container(
                              child: CupertinoPicker(
                                magnification: 1.8,
                                squeeze: 1.3,
                                offAxisFraction: 1.5,
                                backgroundColor: Colors.black87,
                                children: <Widget>[
                                  Text(
                                    "TextWidget",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  MaterialButton(
                                    child: Text(
                                      "Button Widget",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.redAccent,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.home),
                                    color: Colors.white,
                                    iconSize: 40,
                                    onPressed: () {},
                                  )
                                ],
                                itemExtent: 50,
                                //height of each item
                                looping: true,
                                onSelectedItemChanged: (int index) {
                                  selectitem = index;
                                },
                              ),
                            ));
                      });
                },
              ),
              MaterialButton(
                child: Text("Custom matirial Picker"),
                color: Colors.blueAccent,
                onPressed: showMaterialDatePicker,
              )
            ],
          ),
        ),
      ),
    );
  }

  showMaterialDatePicker() async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
  }
}
