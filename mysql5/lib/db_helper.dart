import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*
dependencies:
  sqflite: ^1.3.1+2
  path_provider: ^1.6.22
  path: ^1.7.0

*/
class DatabaseHelper {
  static final _databasename = 'persion.db';
  static final _databaseversion = 1;
  static final table = 'my_table';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnAge = 'age';

// *****Instence of Database*****
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
// *****Instence of Database END*****

  // create database
  _initDatabase() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }
  // create database quret

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnName TEXT NOT NULL, $columnAge INTEGER NOT NULL)');
    /*
        sql code
    await db.execute('''
      CREATE TABLE $table (
        $columnID INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnage INTEGER NOT NULL
      )
      ''');

      */
  }

  // Chack database is or not createed
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

// insert
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

//Getall
  Future<List<Map<String, dynamic>>> quaryallrows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // queryfilter
  Future<List<Map<String, dynamic>>> qusryfilter(int id) async {
    Database db = await instance.database;
    // var res = await db.query(table, where: "id= ?", whereArgs: [id]);
    var res = await db.rawQuery('SELECT * FROM $table WHERE id= ?', [id]);
    return res;
  }

  // Delate data
  Future<int> deleteData(int id) async {
    Database db = await instance.database;
    var res = await db.delete(table, where: 'id = ?', whereArgs: [id]);
    return res;
  }

  // Update data
  Future<int> updateData(int id) async {
    Database db = await instance.database;
    var res = await db.update(
        table,
        {
          columnName: 'Rafiqul isalm',
          columnAge: 21,
        },
        where: "id = ?",
        whereArgs: [id]);
    return res;
  }
}

/*

  ####in Front Page#####



*****Instence of Database*****

final dbHelper = DatabaseHelper.instance;


*****Add*****
void insertData() async {
  Map<String, dynamic> row = {
    DatabaseHelper.columnName: 'Rafiq',
    DatabaseHelper.columnAge: 20,
  };
  final id = await dbHelper.insert(row);
  print(id);
}



*****quaryAll*****

void quaryAll() {
  var allrows = await dbHelper.quaryallrows();
  allrows.forEach((element) {
    print(element);
  });
}



 *****queryfilter*****

void quaryFilter() async {
  var allrows = await dbHelper.qusryfilter(5);
  allrows.forEach((element) {
    print(element);
  });
}



*****Delate data*****

 void delate() async {
   var row = await dbHelper.deleteData(1);
   print(row);
 }


*****Update data*****
  void update() async {
    var row = await dbHelper.updateData(2);
    print(row);
  }



*/
