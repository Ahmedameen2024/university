import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/pags/dashbord/dashbord.dart';
import 'package:flutter_application_10/pags/widget/sidebarmenu.dart';
import 'package:flutter_application_10/shard/app_colors.dart';
import 'package:flutter_application_10/shard/app_responsive.dart';
import 'package:flutter_application_10/control/menu_controller.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  static const String home_pageControScreenRout = 'home_pageControl';

  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      // key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppColors.bgcolor,
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//sidemenu
          if (AppResponsive.isDesktop(context)) ...{
            const Expanded(child: Sidebar()),
          },

          const Expanded(flex: 4, child: Dashbords()),
        ],
      )),
    );
  }
}
