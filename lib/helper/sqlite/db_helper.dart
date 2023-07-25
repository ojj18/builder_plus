import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  String expenseTable = "expense_table";
  String projectTable = "project_table";

  //**** Expense table column name ****//
  String? id = "id";
  String? expenseType = "expenseType";
  String? projectName = "projectName";
  String? vendor = "vendor";
  String? item = "item";
  String? amount = "amount";
  String? billAmount = "billAmount";
  String? paymentType = "paymentType";
  String? notes = "notes";
  String? totalAmount = "totalAmount";
  String? date = "date";

  //**** Project table column name ****//

  String? projectClientName = "projectClientName";
  String? projectLocation = "projectLocation";
  String? projectMobileNumber = "projectMobileNumber";
  String? projectStartDate = "projectStartDate";
  String? projectValue = "projectValue";
  String? projectCreatedDate = "projectCreatedDate";

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();

    String path = '${directory.path}expense.db';

    // Open/create the database at a given path
    var todosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) {
    db.execute(
      'CREATE TABLE $expenseTable($id INTEGER PRIMARY KEY AUTOINCREMENT,$expenseType INTEGER not null, $projectName TEXT not null,$vendor TEXT not null, $item TEXT not null, $amount REAL not null, $billAmount REAL not null, $paymentType INTEGER not null, $notes TEXT not null, $totalAmount REAL not null, $date TEXT not null)',
    );
    db.execute(
      'CREATE TABLE $projectTable($id INTEGER PRIMARY KEY AUTOINCREMENT,$projectClientName TEXT not null,$projectLocation TEXT not null, $projectMobileNumber TEXT not null,  $projectStartDate TEXT not null, $projectValue REAL not null, $projectCreatedDate TEXT not null)',
    );
  }

  // Fetch Operation: Get all todo objects from database
  Future<List<Map<String, dynamic>>> getTodoMapList(String? tableName) async {
    Database db = await database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
    var result = await db.query(tableName!);
    return result;
  }

  // Insert Operation: Insert a todo object to database
  Future<int> insertTodo(dynamic dataModel, String? tableName) async {
    Database db = await database;
    var result = await db.insert(tableName!, dataModel.toJson());
    return result;
  }

  // Update Operation: Update a todo object and save it to database
  Future<int> updateTodo(dynamic dataModel, String? tableName) async {
    var db = await database;
    var result = await db.update(tableName!, dataModel.toJson(),
        where: '$id = ?', whereArgs: [dataModel.id]);
    return result;
  }

  // Delete Operation: Delete a todo object from database
  Future<int> deleteTodo(int id, String? tableName) async {
    var db = await database;
    int result = await db.rawDelete('DELETE FROM $tableName WHERE $id = $id');
    return result;
  }

  // Get number of todo objects in database
  Future<int> getCount(String? tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int? result = Sqflite.firstIntValue(x);
    return result!;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  Future<List<dynamic>> getTodoList(
      String? tableName, dynamic dataModel) async {
    var todoMapList =
        await getTodoMapList(tableName); // Get 'Map List' from database
    int count =
        todoMapList.length; // Count the number of map entries in db table

    List<dynamic> todoList = [];
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      todoList.add(dataModel(todoMapList[i]));
    }

    return todoList;
  }
}
