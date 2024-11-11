import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/controller/Add_task_Controller/addtaskController.dart';
import 'package:task_manager_application/controller/registrationController.dart/registrationController.dart';
import 'package:task_manager_application/view/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Addtaskcontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Registrationcontroller(),
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
