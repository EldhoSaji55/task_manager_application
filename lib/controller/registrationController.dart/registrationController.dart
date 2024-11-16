import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_application/model/userModel.dart';

class Registrationcontroller with ChangeNotifier {
  late Database database;
  Future initDb() async {
    database = await openDatabase("taskdb1.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT, agreedTerms BOOLEAN)');
    });
  }

  showallUsers() async {
    var allusers = await database.rawQuery('SELECT * FROM Users');
    log(allusers.toString());
    notifyListeners();
  }

  Future addUsers(Usermodel addUser) async {
    await database.rawInsert(
        'INSERT INTO Users(name, email, password, agreedTerms) VALUES(?, ?, ?, ?)',
        [addUser.name, addUser.email, addUser.password, addUser.agreedTerms]);
    await showallUsers();
  }
}
