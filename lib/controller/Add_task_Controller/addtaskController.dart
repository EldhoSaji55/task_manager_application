import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Addtaskcontroller with ChangeNotifier {
  late Database database;
  Future initDb() async {
    database = await openDatabase("taskdb.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Task (id INTEGER PRIMARY KEY, user_id INTEGER, taskname TEXT, taskcategory TEXT, Date TEXT, startTime TEXT, endTime TEXT, description TEXT)');
    });
  }

  AddTask() {
    database.rawInsert(
        'INSERT INTO Task(user_id, taskname, taskcategory, Date, startTime, endTime, description) VALUES(?, ?, ?, ?, ?, ?, ?)',
        ['another name', 12345678, 3.1416]);
  }
}
