import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_application/controller/db_helper/db_helper.dart';
import 'package:task_manager_application/model/userModel.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:task_manager_application/view/login_screen/login_screen.dart';

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

  loginUser(
      {required String mail,
      required String password,
      required BuildContext context}) async {
    var result = await database.rawQuery(
        'SELECT * FROM Users WHERE email = ? AND password = ?',
        [mail, password]);
    if (result.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userId", result[0]['id'].toString());
      prefs.setString("email", result[0]['email'].toString());
      log(result.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Bottomnavigationbar(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorConstants.red,
          content: Text("Invalid Credentials")));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
  }
}
