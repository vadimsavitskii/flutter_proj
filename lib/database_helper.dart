import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static final _dbName = 'appDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'appTable';
  static final columnEquation = 'Equation';
  static final columnTimestamp = 'Timestamp';

  // db instance singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase () async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute(
        '''
        CREATE TABLE $_tableName( 
        $columnEquation TEXT NOT NULL, 
        $columnTimestamp TEXT NOT NULL )
        ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

}
