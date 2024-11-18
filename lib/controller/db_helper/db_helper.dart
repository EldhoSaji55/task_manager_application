import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper with ChangeNotifier {
  // Singleton
  DbHelper._();

  static final DbHelper getinstance = DbHelper._();
  late Database database;
  Future initDb() async {
    database = await openDatabase("taskdb1.db", version: 2,
        onCreate: (Database db, int version) {
      // When creating the db, create the table
      db.execute(
          'CREATE TABLE Task(id INTEGER PRIMARY KEY, user_id INTEGER, taskname TEXT, taskcategory TEXT, Date TEXT, startTime TEXT, endTime TEXT, description TEXT)');
      db.execute(
          'CREATE TABLE Users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT, agreedTerms BOOLEAN)');
    });
  }
}
