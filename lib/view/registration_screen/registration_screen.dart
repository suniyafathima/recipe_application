import 'package:flutter/material.dart';
import 'package:recipe_application/view/registration_screen/tabs/login_tab.dart';
import 'package:recipe_application/view/registration_screen/tabs/signup_tab.dart';
import 'package:recipe_application/utils/constants/color_constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "taste",
                      style: TextStyle(
                        color: ColorConstants.darkblue,
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorConstants.mintgreen,
                      child: Text(
                        ".COM",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: ColorConstants.black,
                  unselectedLabelColor: ColorConstants.grey,
                  indicator: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: ColorConstants.black),
                      bottom: BorderSide(
                        color: Colors.transparent,
                      ),
                      right: BorderSide(color: ColorConstants.black),
                      left: BorderSide(color: ColorConstants.black),
                    ),
                  ),
                  tabs: [
                    Tab(text: "Log In"),
                    Tab(text: "Sign Up"),
                  ],
                ),
              
               
                 Expanded(
                      child: TabBarView(
                        children: [
                          LoginTab(),
                          SignupTab(),
                        ],
                      ),
              )
                ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

                      