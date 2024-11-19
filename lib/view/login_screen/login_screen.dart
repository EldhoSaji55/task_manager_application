import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_application/controller/registrationController.dart/registrationController.dart';
import 'package:task_manager_application/main.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/utils/constants/image_constants.dart';
import 'package:task_manager_application/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:task_manager_application/view/home_screen/home_screen.dart';
import 'package:task_manager_application/view/registration_screen/registration_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image(image: AssetImage(ImageConstants.mainLogo)),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back !",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Email Address"),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: Text("Email"), border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password"),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      label: Text("Password"), border: OutlineInputBorder()),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: ColorConstants.mainBlack),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(ColorConstants.primaryColor)),
              onPressed: () async {
                await context.read<Registrationcontroller>().loginUser(
                    mail: emailController.text,
                    password: passwordController.text,
                    context: context);
                emailController.clear();
                passwordController.clear();
              },
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.mainBlack),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Or continue with"),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
                onPressed: () {},
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.google,
                        color: ColorConstants.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Google",
                        style: TextStyle(color: ColorConstants.primaryColor),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: ColorConstants.primaryColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
