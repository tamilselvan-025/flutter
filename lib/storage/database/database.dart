import 'package:flutter_basics/storage/database/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'planets.db'),
      version: 2,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY , name TEXT NOT NULL,age INTEGER NOT NULL,salary INTEGER NOT NULL)",
        );
      },
    );
  }

// insert data
  Future<int> insertUsers(List<User> users) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var user in users) {
      result = await db.insert('user', user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

// retrieve data
  Future<List<User>> retrieveUsers() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('user');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

// delete user
  Future<void> deleteUser(int id) async {
    final db = await initializedDB();
    await db.delete(
      'user',
      where: "id = ? ",
      whereArgs: [id],
    );
  }
}
