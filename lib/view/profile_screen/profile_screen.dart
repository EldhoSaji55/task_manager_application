import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool location = true;
  bool emailNotify = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          _profileImageSection(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.edit,
                    color: ColorConstants.calenderColorList[1],
                  ),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstants.Maingrey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: ColorConstants.calenderColorList[2],
                  ),
                  title: Text(
                    "Change Password",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstants.Maingrey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: ColorConstants.primaryColor,
                    ),
                    title: Text(
                      "location",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    trailing: SizedBox(
                      height: 30,
                      width: 40,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          value: location,
                          activeColor: ColorConstants.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              location = value;
                            });
                          },
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: ColorConstants.calenderColorList[4],
                    ),
                    title: Text(
                      "Email Notification",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    trailing: SizedBox(
                      height: 30,
                      width: 40,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          value: emailNotify,
                          activeColor: ColorConstants.calenderColorList[4],
                          onChanged: (value) {
                            setState(() {
                              emailNotify = value;
                            });
                          },
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: ColorConstants.orange,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstants.Maingrey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: ColorConstants.red,
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstants.Maingrey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _profileImageSection() {
    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  ColorConstants.calenderColorList[0],
                  ColorConstants.calenderColorList[1],
                  ColorConstants.calenderColorList[2],
                  ColorConstants.calenderColorList[3],
                  ColorConstants.calenderColorList[4],
                  ColorConstants.calenderColorList[5],
                ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
            child: CircleAvatar(
              radius: 67,
              backgroundColor: ColorConstants.mainWhite,
              child: CircleAvatar(
                radius: 57,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "John Doe",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
