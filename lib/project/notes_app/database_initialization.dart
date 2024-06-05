import 'package:flutter_basics/project/notes_app/note_model_class.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInitialization {
  static const int _version = 2;
  static const String dbName = "notes.db";

  static Future<Database> _getDataBase() async {
    return openDatabase(join(await getDatabasesPath(), dbName), onCreate: (reference, version) async {
      await reference.execute(
        "CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY ,title TEXT NOT NULL ,description TEXT NOT NULL );",
      );
    },
      version: _version,
    );
  }

  static Future<int> addNote(Note note) async {
    final dataBase = await _getDataBase();

    return dataBase.insert("notes", note.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateNote(Note note) async {
    final dataBase = await _getDataBase();
    return dataBase.update("notes", note.toJson(),
        where: 'id=?', whereArgs: [note.id], conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Note>?> getAllNotes() async {
    final dataBase = await _getDataBase();
    final List<Map<String, dynamic>> maps = await dataBase.query("notes");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }
  static Future<int> deleteNote(int id) async {
    final database = await _getDataBase();
    return database.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  static Future<void> deleteAllNotes()async{
    final database = await _getDataBase();
    database.delete("notes");
    
  }
  static Future<void> deleteTable(String tableName) async {
    final database = await _getDataBase();

    return database.execute('DROP TABLE IF EXISTS $tableName');
  }

  static Future<void> createTable() async {
    final database = await _getDataBase();
    return database.execute(
      "CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY ,title TEXT NOT NULL ,description TEXT NOT NULL );",
    );
   // return database.execute( "CREATE TABLE IF NOT EXISTS notes (a INTEGER PRIMARY KEY ,b TEXT NOT NULL ,c TEXT NOT "
   //"NULL,d INTEGER  ,e TEXT NOT NULL ,f TEXT NOT NULL,g INTEGER  ,h TEXT NOT NULL ,i TEXT NOT NULL,j INTEGER  ,k "
    //"TEXT NOT NULL ,l TEXT NOT NULL,m INTEGER  ,n TEXT NOT NULL ,o TEXT NOT NULL,p INTEGER  ,q TEXT NOT NULL ,r TEXT"
  //  " NOT NULL,s INTEGER  ,t TEXT NOT NULL ,u TEXT NOT NULL,v INTEGER  ,w TEXT NOT NULL ,x TEXT NOT NULL,y INTEGER  "
   // ",z TEXT NOT NULL ,aa TEXT NOT NULL,ab INTEGER  ,ac TEXT NOT NULL ,ad TEXT NOT NULL);");
  }
}
