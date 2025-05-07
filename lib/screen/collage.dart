import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_application_10/model/modeldepartments.dart';
import 'package:flutter_application_10/model/modelgraduates.dart';
import 'package:flutter_application_10/model/modelresearch.dart';
import 'package:flutter_application_10/screen/graduatespage.dart';
import 'package:flutter_application_10/screen/researchpage.dart';
import 'package:flutter_application_10/widget/listcollageanddepartment.dart';
import 'package:get/get.dart';

class FacultiesPage extends StatefulWidget {
  @override
  State<FacultiesPage> createState() => _FacultiesPageState();
}

class _FacultiesPageState extends State<FacultiesPage> {
  int? expandedFacultyIndex; // لتتبع الكلية المفتوحة
  final Map<String, bool> _expandedDepartments = {}; // لتتبع القسم المفتوح

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Faculty>>(
        future: fetchFacultiesWithDepartments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }
          final faculties = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: faculties.length,
            itemBuilder: (context, index) {
              final faculty = faculties[index];
              final isFacultyExpanded = expandedFacultyIndex == index;
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.teal, width: 2),
                  borderRadius: BorderRadius.circular(14),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 2,
                shadowColor: Colors.teal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان الكلية
                    InkWell(
                      onTap: () {
                        setState(() {
                          expandedFacultyIndex =
                              isFacultyExpanded ? null : index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            AdvancedAvatar(
                              size: 45,
                              image: AssetImage(faculty.imagePath),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              faculty.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              isFacultyExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // الأقسام (تظهر فقط إذا الكلية مفتوحة)
                    if (isFacultyExpanded)
                      ...faculty.departments.map((deptDoc) {
                        final isExpanded =
                            _expandedDepartments[deptDoc.name] ?? false;
                        final desc =
                            deptDoc.description ?? 'لا توجد نبذة متاحة.';
                        final bool needsReadMore = desc.length > 100;
                        final String shortDescription = desc;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(height: 24),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _expandedDepartments[deptDoc.name] =
                                      !isExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    color: Colors.teal,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    deptDoc.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isExpanded)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      curve: Curves.easeInOut,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue.shade200,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.blue.shade50,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            desc,
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          if (needsReadMore)
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextButton(
                                                child: Text(isExpanded
                                                    ? 'إخفاء'
                                                    : 'قراءة المزيد'),
                                                onPressed: () {
                                                  setState(() {
                                                    _expandedDepartments[deptDoc
                                                        .name] = !isExpanded;
                                                  });
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton.icon(
                                            label: const Column(
                                              children: [
                                                Icon(Icons.school),
                                                Text('الخريجين'),
                                              ],
                                            ),
                                            onPressed: () {
                                              if (deptDoc.graduates != null &&
                                                  deptDoc
                                                      .graduates!.isNotEmpty) {
                                                Get.to(() => Graduatespage(
                                                      departmentName:
                                                          deptDoc.name,
                                                      graduates:
                                                          deptDoc.graduates!,
                                                    ));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'عرض not found Graduates ${deptDoc.name}')),
                                                );
                                              }
                                            },
                                          ),
                                          ElevatedButton.icon(
                                            label: const Column(
                                              children: [
                                                Icon(Icons.download),
                                                Text('الخطةالدراسية'),
                                              ],
                                            ),
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        'تحميل الخطة الدراسية${deptDoc.name}')),
                                              );
                                            },
                                          ),
                                          ElevatedButton.icon(
                                            label: const Column(
                                              children: [
                                                Icon(Icons.menu_book),
                                                Text('الأبحاث'),
                                              ],
                                            ),
                                            onPressed: () {
                                              if (deptDoc.researches != null &&
                                                  deptDoc
                                                      .researches!.isNotEmpty) {
                                                Get.to(() => ResearchPage(
                                                      departmentName:
                                                          deptDoc.name,
                                                      researches:
                                                          deptDoc.researches!,
                                                    ));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'لا توجد أبحاث')),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
