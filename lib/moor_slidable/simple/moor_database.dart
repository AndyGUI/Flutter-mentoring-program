import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
class Tasks extends Table {
  // Custom primary keys defined as a set of columns
  @override
  Set<Column> get primaryKey => {id, name};

  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();

  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get name => text().withLength(min: 1, max: 50)();

  // DateTime is not natively supported by SQLite
  // Moor converts it to & from UNIX seconds
  DateTimeColumn get dueDate => dateTime().nullable()();

  // Booleans are not supported as well, Moor converts them to integers
  // Simple default values are specified as Constants
  BoolColumn get completed => boolean().withDefault(Constant(false))();
}

// This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [Tasks])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            // Good for debugging - prints SQL in the console
            logStatements: true,
          ),
        );

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  // All tables have getters in the generated class - we can select the tasks table
  Future<List<Task>> getAllTasks() => select(tasks).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Task>> watchAllTasks() => select(tasks).watch();

  Future insertTask(Task task) => into(tasks).insert(task);

  // Updates a Task with a matching primary key
  Future updateTask(Task task) => update(tasks).replace(task);

  Future deleteTask(Task task) => delete(tasks).delete(task);
}
