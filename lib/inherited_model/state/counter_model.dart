import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterState {
  int counter = 0;
}

class CounterStateContainer extends StatefulWidget {
  final Widget child;
  final CounterState counterState = CounterState();

  CounterStateContainer({@required this.child});

  static CounterStateContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
        .data;
  }

  @override
  CounterStateContainerState createState() => new CounterStateContainerState();
}

class CounterStateContainerState extends State<CounterStateContainer> {
  CounterState counterState;

  void increment() {
    setState(() {
      counterState.counter++;
    });
  }

  void add2ToCounter() {
    setState(() {
      counterState.counter += 2;
    });
  }

  void multiplyBy2Counter() {
    setState(() {
      counterState.counter *= 2;
    });
  }

  void subtract7FromCounter() {
    setState(() {
      counterState.counter -= 7;
    });
  }

  @override
  void initState() {
    counterState = widget.counterState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final CounterStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
