import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  bool selectedDepartment = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: 10,
        itemBuilder: (context, i) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.teal,
                width: 2,
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: ExpansionTile(
                leading: AdvancedAvatar(
                  size: 45, image: const AssetImage('images/ResearchIcon.png'),
                  // backgroundImage: AssetImage(faculty.imagePath),
                  // radius: 25,
                ),
                title: Text(
                  'Techear',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('collage applyed seinces'),
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('dept.name'),
                          onTap: () {
                            setState(() {
                              selectedDepartment != selectedDepartment;
                            });
                          },
                        ),
                        if (selectedDepartment) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              'لا توجد نبذة متاحة.',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          //
                          Divider(
                            height: 2,
                          ),
                        ],
                      ]),
                ]),
          );
        });
  }
}
