import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_application_10/controll/listgradustes.dart';
import 'package:flutter_application_10/controll/listgradustes.dart';
import 'package:flutter_application_10/controll/nav_controller.dart';
import 'package:flutter_application_10/model/modelgraduates.dart';
import 'package:flutter_application_10/screen/collage.dart';
import 'package:get/get.dart';

class Graduatespage extends StatelessWidget {
  // const Graduatespage({super.key});

  final String departmentName;
  final List<Graduate> graduates;

  const Graduatespage(
      {super.key, required this.departmentName, required this.graduates});

  @override
  Widget build(BuildContext context, {Key? key}) {
    // final NavController navController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Graduates $departmentName'),
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              // navController.currentPage.value = FacultiesPage();
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: graduates!.length,
        itemBuilder: (context, index) {
          final graduate = graduates![index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.teal,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(graduate.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(graduate.research),
              ),
              trailing: Text(
                graduate.year.toString(),
              ),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('images/ResearchIcon.png'),
              ),
            ),
          );
        },
      ),
    );
  }
}
