import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today/app_bindings.dart';
import 'package:today/screens/face_detection/face_detection.dart';
import 'package:today/screens/home.dart';
import 'package:today/screens/login.dart';
import 'package:today/screens/ocr/scan_image.dart';
import 'package:today/screens/ocr/scanned_images.dart';
import 'package:today/screens/sign_up.dart';
import 'package:today/screens/tasks.dart';
import 'package:today/screens/test.dart';
import 'package:today/screens/welcome.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      // theme: ThemeData.dark(),
      initialRoute: ScannedImages.id,
      getPages: [
        GetPage(name: Welcome.id, page: () => Welcome()),
        GetPage(name: Login.id, page: () => Login()),
        GetPage(name: SignUp.id, page: () => SignUp()),
        GetPage(name: Home.id, page: () => Home()),
        GetPage(name: Tasks.id, page: () => Tasks()),
        GetPage(name: Test.id, page: () => Test()),
        GetPage(name: FaceDetection.id, page: () => FaceDetection()),
        GetPage(name: ScannedImages.id, page: () => ScannedImages()),
        GetPage(name: ScanImage.id, page: () => ScanImage()),
      ],
    );
  }
}
