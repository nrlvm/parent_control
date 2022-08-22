// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:async';
import 'package:parent_control/src/block/database/database_block.dart';
import 'package:parent_control/src/model/database/users_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableName = 'userTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnGender = 'gender';
  final String columnPhoto = 'photo';

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
      'CREATE TABLE $tableName('
      '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$columnName TEXT, '
      '$columnGender INTEGER,'
      '$columnPhoto TEXT )',
    );
  }

  Future<int> saveUser(UsersModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert("userTable", data.toJson());
    return result;
  }

  Future<List<UsersModel>> getUsers() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableName');
    List<UsersModel> users = [];
    for (int i = 0; i < list.length; i++) {
      UsersModel data = UsersModel(
        name: list[i][columnName],
        id: list[i][columnId],
        gender: list[i][columnGender],
        photo: '',
      );
      users.add(data);
    }
    return users;
  }

  Future<int> updateUser(UsersModel data) async {
    var dbClient = await db;
    return await dbClient.update(
      tableName,
      data.toJson(),
      where: "$columnId = ?",
      whereArgs: [data.id],
    );
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableName');
  }
}

final dataBaseBlock = DataBaseBlock();
