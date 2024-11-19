import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_application/controller/db_helper/db_helper.dart';
import 'package:task_manager_application/model/addtaskModel.dart';

class Addtaskcontroller with ChangeNotifier {
  late Database database = DbHelper.getinstance.database;
  String currentStartHour = "0";
  String currentStartMin = "0";
  String currentEndHour = "0";
  String currentEndMin = "0";
  var storedtasks;

  showalltasks() async {
    storedtasks = await database.rawQuery('SELECT * FROM Task');
    log(storedtasks.toString());
    notifyListeners();
  }

  Future AddTask(Addtaskmodel taskmodel) async {
    await database.rawInsert(
        'INSERT INTO Task(user_id,taskname, taskcategory, Date, startTime, endTime, description) VALUES(?,?, ?, ?, ?, ?, ?)',
        [
          taskmodel.user_id,
          taskmodel.taskName,
          taskmodel.taskcategory,
          taskmodel.Date,
          taskmodel.startTime,
          taskmodel.endTime,
          taskmodel.description
        ]);
    await showalltasks();
  }

  Future updateStarttime({
    required String startHour,
    required String startMin,
  }) async {
    currentStartHour = startHour;
    currentStartMin = startMin;

    notifyListeners();
  }

  Future updateEndtime(
      {required String endHour, required String endMinute}) async {
    currentEndHour = endHour;
    currentEndMin = endMinute;

    notifyListeners();
  }
}
