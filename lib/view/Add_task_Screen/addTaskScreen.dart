import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/controller/Add_task_Controller/addtaskController.dart';
import 'package:task_manager_application/main.dart';
import 'package:task_manager_application/model/addtaskModel.dart';
import 'package:task_manager_application/utils/AppUtils/app_utils.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/global_widgets/ClockWidget.dart';

class Addtaskscreen extends StatefulWidget {
  const Addtaskscreen({super.key});

  @override
  State<Addtaskscreen> createState() => _AddtaskscreenState();
}

class _AddtaskscreenState extends State<Addtaskscreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  // TextEditingController startTimeController = TextEditingController();
  // TextEditingController endTimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<Addtaskcontroller>().showalltasks();
      },
    );
    super.initState();
  }

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
                controller: taskNameController,
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
                controller: taskCategoryController,
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
                controller: dateController,
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
                            dateController.text = _formatteddate.toString();
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
                    startTime: true,
                  ),
                  ClockWidget(
                    hour: endHour,
                    min: endMin,
                    title: "End Time",
                    endTime: true,
                  )
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
                controller: descriptionController,
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
                      onPressed: () async {
                        final StartTime = context.read<Addtaskcontroller>();
                        String storedtoken =
                            await AppUtils.getstoredAccessToken();

                        Addtaskmodel data = Addtaskmodel(
                            user_id: storedtoken,
                            taskName: taskNameController.text,
                            taskcategory: taskCategoryController.text,
                            Date: dateController.text,
                            startTime:
                                "${StartTime.currentStartHour} : ${StartTime.currentStartMin}",
                            endTime:
                                "${StartTime.currentEndHour} : ${StartTime.currentEndMin}",
                            description: descriptionController.text);
                        await context.read<Addtaskcontroller>().AddTask(data);
                        Navigator.pop(context);
                      },
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
