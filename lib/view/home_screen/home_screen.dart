import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/controller/Add_task_Controller/addtaskController.dart';
import 'package:task_manager_application/controller/db_helper/db_helper.dart';
import 'package:task_manager_application/main.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:task_manager_application/view/global_widgets/overlappingCircleAvatarWidget.dart';
import 'package:task_manager_application/view/home_screen/widgets/CompletedTaskWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await DbHelper.getinstance.initDb();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List SampleImage = [
      "https://images.pexels.com/photos/5837666/pexels-photo-5837666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/248077/pexels-photo-248077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1446161/pexels-photo-1446161.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/3641059/pexels-photo-3641059.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/2735970/pexels-photo-2735970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ];

    return Scaffold(
      appBar: _appbarSection(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SearchSection(),
            _TodaysTasksSection(context),
            _CompletedTaskSection(SampleImage),
          ],
        ),
      ),
    );
  }

  Widget _TodaysTasksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      ColorConstants.mainWhite,
                      ColorConstants.primaryColor,
                      ColorConstants.secondaryColor
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Progress Summary",
                        style: TextStyle(
                            color: ColorConstants.mainWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "15 Tasks",
                        style: TextStyle(color: ColorConstants.mainWhite),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          OverlappingCircleAvatarWidget(
                              imageUrl:
                                  "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                          OverlappingCircleAvatarWidget(
                              imageUrl:
                                  "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Progress",
                                style: TextStyle(
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "50%",
                                style: TextStyle(
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Container(
                            width: 115,
                            height: 10,
                            child: LinearProgressIndicator(
                              backgroundColor:
                                  Colors.transparent.withOpacity(0.1),
                              color: ColorConstants.primaryColor,
                              value: 0.5,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Tasks",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.mainBlack),
              ),
              Text(
                "See All",
                style: TextStyle(color: ColorConstants.primaryColor),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://logowik.com/content/uploads/images/google-tasks7052.logowik.com.webp"))),
                      ),
                      title: Text("UI Designing"),
                      subtitle: Text(
                        "09:00 AM - 11:00AM",
                        style: TextStyle(
                            fontSize: 13, color: ColorConstants.Maingrey),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorConstants.Maingrey,
                        size: 18,
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }

  Widget _CompletedTaskSection(List<dynamic> SampleImage) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Completed Tasks",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.mainBlack),
              ),
              Text(
                "See All",
                style: TextStyle(color: ColorConstants.primaryColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CompletedTaskWidget(SampleImage: SampleImage),
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: 10),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _SearchSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    border: Border.all(
                        color: ColorConstants.primaryColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        "Search Here",
                        style: TextStyle(
                            color: ColorConstants.mainWhite, fontSize: 16),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: ColorConstants.mainWhite,
                        ),
                      ),
                      border: InputBorder.none),
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: ColorConstants.primaryColor,
              radius: 25,
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.sort,
                color: ColorConstants.mainWhite,
              )),
            ),
          )
        ],
      ),
    );
  }

  AppBar _appbarSection() {
    return AppBar(
      forceMaterialTransparency: true,
      // scrolledUnderElevation: 0,
      // surfaceTintColor: Colors.transparent,
      toolbarHeight: 80,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 14),
          ),
          Text("User Name")
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
