import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_application/controller/db_helper/db_helper.dart';
import 'package:task_manager_application/model/userModel.dart';

class Registrationcontroller with ChangeNotifier {
  late Database database = DbHelper.getinstance.database;

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
