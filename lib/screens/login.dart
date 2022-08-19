import 'package:flutter/material.dart';
import 'package:today/components/custom_widgets.dart';
import 'package:today/components/rounded_button.dart';
import 'package:get/get.dart';
import 'package:today/screens/home.dart';
import 'package:today/screens/sign_up.dart';
import '../app_data.dart';
import '../constants.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static const String id = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                titleText('Login'),
                SizedBox(height: 17),
                smallText('Add your details to login'),
                SizedBox(height: 35),
                TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Your Email')),
                SizedBox(height: 25),
                TextField(decoration: kTextFieldDecoration),
                SizedBox(height: 25),
                RoundedButton(
                  color: AppData.mainColor,
                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                  onPressed: () => Get.offAllNamed(Home.id),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallText('Don\'t have an Account? '),
                    TextButton(
                      onPressed: () => Get.offNamed(SignUp.id),
                      child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            Divider(color: AppData.primaryFontColor, thickness: 4, indent: 100, endIndent: 100),
          ],
        ),
      ),
    );
  }
}
