import 'package:flutter/material.dart';
import 'package:flutter_application_10/shard/app_colors.dart';

class Research extends StatefulWidget {
  const Research({super.key});

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.bgcolor, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 3)),
                      labelText: 'Research name'),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          const Divider(thickness: 0.5, color: Colors.green),
        ]));
  }
}
