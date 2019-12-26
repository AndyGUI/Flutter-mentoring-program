import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/counter'
    '/counter_model.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/bloc/theme/theme_bloc.dart';
import 'package:flutter_mentoring_programm/bloc_advanced/screen/first_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
      ],
      child: AppHolder(),
    );
  }
}

class AppHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: FirstScreen(),
          theme: theme,
        );
      },
    );
  }
}
