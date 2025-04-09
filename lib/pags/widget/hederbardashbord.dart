// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_10/shard/app_colors.dart';

class Hederbardashbord extends StatefulWidget {
  final String page_name;

  const Hederbardashbord({super.key, required this.page_name});

  @override
  State<Hederbardashbord> createState() => _HederbardashbordState();
}

class _HederbardashbordState extends State<Hederbardashbord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: hedrow(name: widget.page_name),
      ),
    );
  }

  Widget navIcon({icon}) {
    return Icon(icon, color: AppColors.bgsidemenu);
  }

  Widget hedrow({name}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.bgcolor),
      height: 60,
      child: Row(
        children: [
          // if (!AppResponsive.isDesktop(context))
          //   IconButton(icon: Icon(Icons.menu, color: AppColors.bgsidemenu),
          //       onPressed:Provider.of<MenuController>(context,listen: false).controlMenu
          //       )
          Text(
            '$name',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Row(
            children: [
              navIcon(icon: Icons.search),
              navIcon(icon: Icons.notifications),
              navIcon(icon: Icons.search),
            ],
          )
        ],
      ),
    );
  }
}
