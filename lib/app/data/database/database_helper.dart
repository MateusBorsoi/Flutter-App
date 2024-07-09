import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'appauth.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT)''');
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {String? whereCause, List<dynamic>? whereArgs}) async {
    Database db = await database;
    return await db.query(table);
  }

  Future<int> insert(String table, Map<String, dynamic> values) async {
    Database db = await database;
    return await db.insert(table, values);
  }

  Future<int> update(String table, Map<String, dynamic> values,
      String whereCause, List<dynamic> whereArgs) async {
    Database db = await database;
    return await db.update(table, values,
        where: whereCause, whereArgs: whereArgs);
  }

  Future<int> delete(
      String table, String whereCause, List<dynamic> whereArgs) async {
    Database db = await database;
    return await db.delete(table, where: whereCause, whereArgs: whereArgs);
  }
}
