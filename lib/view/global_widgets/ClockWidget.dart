import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';

class ClockWidget extends StatefulWidget {
  ClockWidget(
      {super.key, required this.hour, required this.min, required this.title});

  int hour;
  int min;
  String title;

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Column(
                children: [
                  NumberPicker(
                    minValue: 0,
                    maxValue: 23,
                    value: widget.hour,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 40,
                    onChanged: (value) {
                      setState(() {
                        widget.hour = value;
                      });
                    },
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: ColorConstants.mainWhite),
                            bottom: BorderSide(color: ColorConstants.mainWhite),
                            right:
                                BorderSide(color: ColorConstants.mainWhite))),
                  ),
                  Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: ColorConstants.mainWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Center(child: Text("Hour")))
                ],
              ),
              Column(
                children: [
                  NumberPicker(
                    minValue: 0,
                    maxValue: 59,
                    value: widget.min,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 40,
                    onChanged: (value) {
                      setState(() {
                        widget.min = value;
                      });
                    },
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(color: ColorConstants.mainWhite),
                      bottom: BorderSide(color: ColorConstants.mainWhite),
                    )),
                  ),
                  Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: ColorConstants.mainWhite,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: Center(child: Text("Minute")))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
