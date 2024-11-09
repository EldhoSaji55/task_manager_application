import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime? selectedDateUpdate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _AppbarSection(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              horizontalScrollCalender(),
              SizedBox(
                height: 20,
              ),
              _ScheduleSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _ScheduleSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Schedule",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 35,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorConstants.primaryColor),
                        foregroundColor:
                            WidgetStatePropertyAll(ColorConstants.mainWhite),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: Text("+ Add New")),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10 * 85,
            child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: ColorConstants.calenderColorList[
                              index % ColorConstants.calenderColorList.length]
                          .withOpacity(0.25),
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorConstants.calenderColorList[index %
                                ColorConstants.calenderColorList.length],
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              "https://img.freepik.com/free-vector/tiny-programmers-big-laptop-writing-script-coders-app-developers-with-computers-flat-vector-illustration-programming-engineering-software-development-concept-banner-landing-web-page_74855-25360.jpg?t=st=1731171984~exp=1731175584~hmac=26dc6decbe90b6fb9364c486069571dfd3f252005f337488189f48e0b6dd6990&w=1060"),
                        ),
                      ),
                      title: Text(
                        "UI Design Presentation",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "09:00 AM - 11:00 AM",
                        style: TextStyle(
                            color: ColorConstants.calenderColorList[index %
                                ColorConstants.calenderColorList.length],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: 10),
          )
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

class horizontalScrollCalender extends StatelessWidget {
  const horizontalScrollCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        // selectedDateUpdate = selectedDate;
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.custom("EEEE \ndd MMMM yyyy"),
      ),
      dayProps: const EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstants.secondaryColor,
                ColorConstants.primaryColor,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
