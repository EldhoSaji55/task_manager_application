import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Registrationcontroller with ChangeNotifier {
  late Database database;
  Future initDb() async {
    database = await openDatabase("taskdb.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT, agreedTerms BOOLEAN, isActive BOOLEAN)');
    });
  }
}
