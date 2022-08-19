import 'package:flutter/material.dart';
import 'package:today/components/custom_widgets.dart';
import 'package:today/components/rounded_button.dart';
import 'package:get/get.dart';
import 'package:today/screens/home.dart';
import 'package:today/screens/login.dart';
import '../app_data.dart';
import '../constants.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 5),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText('Sign Up'),
              SizedBox(height: 17),
              smallText('Add your details to sign up'),
              SizedBox(height: 26),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Full Name')),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Username')),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Email')),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration),
              SizedBox(height: 20),
              TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Confirm Password')),
              SizedBox(height: 25),
              RoundedButton(
                color: AppData.mainColor,
                child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 16)),
                onPressed: () => Get.offAllNamed(Home.id),
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  smallText('Already have an Account? '),
                  TextButton(
                    onPressed: () => Get.offNamed(Login.id),
                    child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Divider(color: AppData.primaryFontColor, thickness: 4, indent: 100, endIndent: 100),
            ],
          ),
        ],
      ),
    );
  }
}
