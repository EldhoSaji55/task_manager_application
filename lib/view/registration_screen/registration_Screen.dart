import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/utils/constants/image_constants.dart';
import 'package:task_manager_application/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
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
                    "Create Your Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Full Name"),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Full Name"), border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email Address"),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
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
                    decoration: InputDecoration(
                        label: Text("Password"), border: OutlineInputBorder()),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: ischecked,
                        activeColor: ColorConstants.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                            text: "I have read & agreed to DayTask ",
                            style: TextStyle(color: ColorConstants.mainBlack),
                            children: [
                              TextSpan(
                                  text: "Privacy Policy\n",
                                  style: TextStyle(
                                      color: ColorConstants.primaryColor)),
                              TextSpan(
                                text: "Terms and Conditions",
                                style: TextStyle(
                                    color: ColorConstants.primaryColor),
                              )
                            ]),
                      ),
                    ],
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
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Register",
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: ColorConstants.primaryColor),
                    ))
              ])
            ])));
  }
}
