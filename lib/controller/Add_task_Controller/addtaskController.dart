import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_application/model/addtaskModel.dart';

class Addtaskcontroller with ChangeNotifier {
  late Database database;
  var storedtasks;
  Future initDb() async {
    database = await openDatabase("taskdb.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Task (id INTEGER PRIMARY KEY, user_id INTEGER, taskname TEXT, taskcategory TEXT, Date TEXT, startTime TEXT, endTime TEXT, description TEXT)');
    });
  }

  showalltasks() async {
    storedtasks = await database.rawQuery('SELECT * FROM Task');
    log(storedtasks.toString());
  }

  Future AddTask(Addtaskmodel taskmodel) async {
    await database.rawInsert(
        'INSERT INTO Task(taskname, taskcategory, Date, startTime, endTime, description) VALUES(?, ?, ?, ?, ?, ?)',
        [
          taskmodel.taskName,
          taskmodel.taskcategory,
          taskmodel.Date,
          taskmodel.startTime,
          taskmodel.endTime,
          taskmodel.description
        ]);
  }
}
