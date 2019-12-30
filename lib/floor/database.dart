import 'package:floor/floor.dart';
import 'package:flutter_mentoring_programm/floor/task.dart';
import 'package:flutter_mentoring_programm/floor/task_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dart:async';
part 'database.g.dart';

@Database(version: 1, entities: [Task])
abstract class FlutterDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
