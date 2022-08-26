// ignore: depend_on_referenced_packages
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:parent_control/src/ui/main_screen/main_screen.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableUserName = 'userTable';
  final String columnUserId = 'id';
  final String columnUserName = 'name';
  final String columnUserGender = 'gender';
  final String columnUserPhoto = 'photo';

  final String tableTaskName = 'taskTable';
  final String columnTaskId = 'task_id';
  final String columnTaskYear = 'year';
  final String columnTaskMonth = 'month';
  final String columnTaskDay = 'day';
  final String columnTaskStart = 'start';
  final String columnTaskEnd = 'end';
  final String columnTaskColor = 'color';
  final String columnTaskTitle = 'title';
  final String columnTaskUserId = 'user_id';

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'prep_test.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableUserName('
      '$columnUserId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$columnUserName TEXT, '
      '$columnUserGender INTEGER,'
      '$columnUserPhoto TEXT)',
    );
    await db.execute(
      'CREATE TABLE $tableTaskName('
      '$columnTaskId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$columnTaskYear INTEGER, '
      '$columnTaskMonth INTEGER, '
      '$columnTaskDay INTEGER, '
      '$columnTaskStart INTEGER, '
      '$columnTaskEnd INTEGER, '
      '$columnTaskColor INTEGER, '
      '$columnTaskTitle TEXT, '
      '$columnTaskUserId INTEGER)',
    );
  }

  /// save task
  saveTask(TaskModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert('taskTable', data.toJson());
    return result;
  }

  ///save user
  Future<int> saveUser(UsersModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert("userTable", data.toJson());
    return result;
  }

  ///get all task

  Future<List<TaskModel>> getTasks() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableTaskName');
    List<TaskModel> tasks = [];
    for (int i = 0; i < list.length; i++) {
      TaskModel data = TaskModel(
        color: list[i][columnTaskColor],
        userId: usersModel.id,
        year: list[i][columnTaskYear],
        month: list[i][columnTaskMonth],
        day: list[i][columnTaskDay],
        start: list[i][columnTaskStart],
        end: list[i][columnTaskEnd],
        title: list[i][columnTaskTitle],
      );
      tasks.add(data);
    }
    return tasks;
  }

  /// get all user
  Future<List<UsersModel>> getUsers() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableUserName');
    List<UsersModel> users = [];
    for (int i = 0; i < list.length; i++) {
      UsersModel data = UsersModel(
        name: list[i][columnUserName],
        id: list[i][columnUserId],
        gender: list[i][columnUserGender],
        photo: list[i][columnUserPhoto],
      );
      users.add(data);
    }
    return users;
  }

  Future<int> updateUser(UsersModel data) async {
    var dbClient = await db;
    return await dbClient.update(
      tableUserName,
      data.toJson(),
      where: "$columnUserId = ?",
      whereArgs: [data.id],
    );
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableUserName,
      where: '$columnUserId = ?',
      whereArgs: [id],
    );
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableUserName');
  }
}
