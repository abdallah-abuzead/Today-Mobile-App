import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today/components/custom_widgets.dart';
import 'package:today/components/rounded_button.dart';
import 'package:today/screens/login.dart';
import 'package:today/screens/sign_up.dart';

import '../app_data.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  static const String id = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('images/welcome.jpg'),
                // child: Image.file(File('/data/user/0/com.abuzead.today/cache/b42c295f-dc35-4589-abbc-143f89b9f3c91193769329729291345.jpg')),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    logoText(),
                    SizedBox(height: 35),
                    smallText(
                      'Manage work projects, assign tasks to all users, \n and follow projects and tasks status',
                      fontSize: 13,
                    ),
                    SizedBox(height: 50),
                    RoundedButton(
                      color: AppData.mainColor,
                      child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                      onPressed: () => Get.toNamed(Login.id),
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      color: Colors.white,
                      child: Text('Create an Account', style: TextStyle(color: AppData.mainColor, fontSize: 16)),
                      hasBorder: true,
                      onPressed: () => Get.toNamed(SignUp.id),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: AppData.primaryFontColor, thickness: 4, indent: 130, endIndent: 130),
        ],
      ),
    );
  }
}
