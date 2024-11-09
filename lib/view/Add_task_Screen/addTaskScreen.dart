import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/global_widgets/ClockWidget.dart';

class Addtaskscreen extends StatefulWidget {
  const Addtaskscreen({super.key});

  @override
  State<Addtaskscreen> createState() => _AddtaskscreenState();
}

class _AddtaskscreenState extends State<Addtaskscreen> {
  TextEditingController _dateController = TextEditingController();
  var startHour = 0;
  var startMin = 0;
  var endHour = 0;
  var endMin = 0;
  @override
  Widget build(BuildContext context) {
    DateTime? _date;

    return Scaffold(
      appBar: _AppBarSection(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Task Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Category",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Date & Time",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "Date",
                    suffixIcon: IconButton(
                        onPressed: () async {
                          _date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100));

                          final _formatteddate =
                              DateFormat("dd-MM-yyyy").format(_date!);
                          setState(() {
                            _dateController.text = _formatteddate.toString();
                          });
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: ColorConstants.primaryColor,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClockWidget(
                    hour: startHour,
                    min: startMin,
                    title: "Start Time",
                  ),
                  ClockWidget(hour: endHour, min: endMin, title: "End Time")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              ColorConstants.primaryColor),
                          foregroundColor:
                              WidgetStatePropertyAll(ColorConstants.mainWhite)),
                      onPressed: () {},
                      child: Text("Create Task")))
            ],
          ),
        ),
      ),
    );
  }

  AppBar _AppBarSection(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_sharp)),
      title: Text(
        "Create New Task",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
