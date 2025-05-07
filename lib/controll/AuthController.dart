import 'package:flutter_application_10/dashbord/homepage_dashbord.dart';
import 'package:flutter_application_10/screen/collage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../screen/home.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var userType = ''.obs;
  // 'admin' أو 'user'
  // final storage = FlutterSecureStorage();

  void login(
    String username,
    String password,
  ) {
    // مثال بسيط - استبدله بالتحقق الحقيقي
    if (username == 'admin' && password == '1234') {
      userType.value = 'admin';
      isLoggedIn.value = true;
      // final box = GetStorage();
      // box.write('isLoggedIn', true);
      Get.offAll(() => HomepageDashbord());
    } else if (username == 'user' && password == '1234') {
      userType.value = 'user';
      isLoggedIn.value = true;
      Get.offAll(() => Home()); // واجهة المستخدم العادي
    } else {
      Get.snackbar('خطأ', 'بيانات الدخول غير صحيحة');
    }
  }
}
