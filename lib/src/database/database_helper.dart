// ignore: depend_on_referenced_packages
import 'package:parent_control/src/model/database/task_model.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableUserName = 'userTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnGender = 'gender';
  final String columnPhoto = 'photo';

  final String tableTaskName = 'taskTable';
  final String columnTaskId = 'task_id';
  final String columnTaskYear = 'year';
  final String cMonth2 = 'month';
  final String cDay2 = 'day';
  final String cStart2 = 'start';
  final String cEnd2 = 'end';
  final String cColor2 = 'color';
  final String cTitle2 = 'title';
  final String cUserId2 = 'user_id';

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
      '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$columnName TEXT, '
      '$columnGender INTEGER,'
      '$columnPhoto TEXT)',
    );
    await db.execute(
      'CREATE TABLE $tableTaskName('
      '$columnTaskId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$columnTaskYear INTEGER, '
      '$cMonth2 INTEGER, '
      '$cDay2 INTEGER, '
      '$cStart2 INTEGER, '
      '$cEnd2 INTEGER, '
      '$cColor2 INTEGER, '
      '$cTitle2 TEXT, '
      '$cUserId2 INTEGER)',
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

  /// get all user
  Future<List<UsersModel>> getUsers() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableUserName');
    List<UsersModel> users = [];
    for (int i = 0; i < list.length; i++) {
      UsersModel data = UsersModel(
        name: list[i][columnName],
        id: list[i][columnId],
        gender: list[i][columnGender],
        photo: list[i][columnPhoto],
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
      where: "$columnId = ?",
      whereArgs: [data.id],
    );
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableUserName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableUserName');
  }
}
