import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _AppbarSection(),
        body: Column(
          children: [
            _BodyDateAsTitleSection(),
          ],
        ),
      ),
    );
  }

  Widget _BodyDateAsTitleSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: TextStyle(
                fontSize: 18,
                color: ColorConstants.Maingrey,
                fontWeight: FontWeight.w500),
          ),
          Text(
            "Monday, 04 Apr",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  AppBar _AppbarSection() {
    return AppBar(
      title: Center(
          child: Text(
        "Upcoming Task",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
