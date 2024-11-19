import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/controller/db_helper/db_helper.dart';
import 'package:task_manager_application/controller/registrationController.dart/registrationController.dart';
import 'package:task_manager_application/utils/AppUtils/app_utils.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/utils/constants/image_constants.dart';
import 'package:task_manager_application/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:task_manager_application/view/home_screen/home_screen.dart';
import 'package:task_manager_application/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await DbHelper.getinstance.initDb();
        await context.read<Registrationcontroller>().showallUsers();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.splashIcon))),
            ),
            RichText(
              text: TextSpan(
                  text: "Manage \nYour \nTask with ",
                  style: TextStyle(
                      fontSize: 60,
                      color: ColorConstants.mainBlack,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "DayTask",
                        style: TextStyle(
                            fontSize: 60,
                            color: ColorConstants.primaryColor,
                            fontWeight: FontWeight.bold))
                  ]),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(ColorConstants.primaryColor)),
                onPressed: () async {
                  String storedtoken = await AppUtils.getstoredAccessToken();
                  if (storedtoken.isNotEmpty) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bottomnavigationbar(),
                        ));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  }
                },
                child: SizedBox(
                  child: Center(
                      child: Text(
                    "Let's Start",
                    style: TextStyle(
                        color: ColorConstants.mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  )),
                  height: 60,
                  width: double.infinity,
                ))
          ],
        ),
      ),
    );
  }
}
