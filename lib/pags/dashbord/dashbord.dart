import 'package:flutter/material.dart';
import 'package:flutter_application_10/pags/widget/hederbardashbord.dart';
import 'package:flutter_application_10/pags/widget/research.dart';
import 'package:flutter_application_10/shard/app_colors.dart';

class Dashbords extends StatefulWidget {
  const Dashbords({super.key});

  @override
  State<Dashbords> createState() => _DashbordsState();
}

class _DashbordsState extends State<Dashbords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.maincolor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          const Hederbardashbord(
            page_name: 'Dashbord',
          ),
          const Divider(
            height: 5,
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [
                          // TableCollagedata()
                          // TableDepartmentdata(),
                          // TablGriduintdata(),
                          Research()
                        ],
                      ),
                    ),
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
