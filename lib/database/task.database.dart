import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../domain/task.dart';
import 'scripts.dart';

class TaskDataBase {
  static final TaskDataBase instance = TaskDataBase._init();
  static Database? _database;

  TaskDataBase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDataBase(nameDB);
    return _database!;
  }

  Future<Database> initDataBase(String name) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, name);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute(createTable);
  }

  Future<int> insert(Task task) async {
    final db = await instance.database;
    return await db.insert(tableName, task.toJson());
  }

  Future<List<Task>> readAll() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((taskJson) => Task.fromJson(taskJson)).toList();
  }
}