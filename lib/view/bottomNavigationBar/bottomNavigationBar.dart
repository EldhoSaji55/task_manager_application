import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/Add_task_Screen/addTaskScreen.dart';
import 'package:task_manager_application/view/Calender_Screen/calender_screen.dart';
import 'package:task_manager_application/view/chat_Screen/chat_Screen.dart';
import 'package:task_manager_application/view/home_screen/home_screen.dart';
import 'package:task_manager_application/view/profile_screen/profile_screen.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  List screens = [
    HomeScreen(),
    CalenderScreen(),
    "",
    ChatScreen(),
    ProfileScreen(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      bottomNavigationBar: ConvexAppBar(
        onTap: (value) {
          value == 2
              ? showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * .90,
                      child: Addtaskscreen()),
                )
              : index = value;
          setState(() {});
        },
        items: [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.calendar_month_rounded),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.chat),
          TabItem(icon: Icons.person),
        ],
        backgroundColor: ColorConstants.primaryColor,
      ),
      body: screens[index],
    ));
  }
}
