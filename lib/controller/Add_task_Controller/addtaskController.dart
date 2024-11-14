import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_application/model/addtaskModel.dart';

class Addtaskcontroller with ChangeNotifier {
  late Database database;

  var storedtasks;
  Future initDb() async {
    database = await openDatabase("taskdb1.db", version: 1,
        onCreate: (Database db, int version) {
      // When creating the db, create the table
      db.execute(
          'CREATE TABLE Task(id INTEGER PRIMARY KEY, user_id INTEGER, taskname TEXT, taskcategory TEXT, Date TEXT, startTime TEXT, endTime TEXT, description TEXT)');
    });

    notifyListeners();
  }

  showalltasks() async {
    storedtasks = await database.rawQuery('SELECT * FROM Task');
    log(storedtasks.toString());
    notifyListeners();
  }

  Future AddTask(Addtaskmodel taskmodel) async {
    await database.rawInsert(
        'INSERT INTO Task(user_id,taskname, taskcategory, Date, startTime, endTime, description) VALUES(?,?, ?, ?, ?, ?, ?)',
        [
          1,
          taskmodel.taskName,
          taskmodel.taskcategory,
          taskmodel.Date,
          taskmodel.startTime,
          taskmodel.endTime,
          taskmodel.description
        ]);
    await showalltasks();
  }
}
