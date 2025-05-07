import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:device_preview/device_preview.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_application_10/widget/listcollageanddepartment.dart';

// import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter_application_10/controll/nav_controller.dart';
import 'package:flutter_application_10/dashbord/homepage_dashbord.dart';
import 'package:flutter_application_10/screen/home.dart';
import 'package:flutter_application_10/screen/sin_in.dart';
import 'package:flutter_application_10/screen/welcom_screen.dart';
import 'package:flutter_application_10/them/darkthem.dart';
import 'package:flutter_application_10/them/lightthem.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  runApp(const MyApp());
}

// void main() {
//   Get.put(NavController()); // تسجيل NavController
//   // Get.put(AuthController()); // تسجيل AuthController
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ThemeData appThem = lightTheme;

  // void _changeTheme() {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appThem,
      // home: HomepageDashbord(),
      routes: <String, WidgetBuilder>{
        WelcomScreen.welcomScreenRout: (context) => Home(),
        SinIn.sinInScreenRout: (context) => const SinIn(),

        '/home': (context) => Home(),
        // ... باقي الصفحات

        // SinUp.sinUpScreenRoute: (context) => const SinUp(),
        // '/create-admin': (context) => const TableCollagedata(),
        // TableCollagedata.TableCollagedataRout: (context) =>
        //     const TableCollagedata(),
        // Home_page.home_pageControScreenRout: (context) => const Home_page(),
        // VerificationScreen.verificationScreenRoute: (context) =>
        //     const VerificationScreen(),
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.emailVerified) {
            return Home();
          } else {
            return SinIn();
          }
        },
      ),
    );
  }
}
