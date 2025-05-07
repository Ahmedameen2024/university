import 'package:flutter/material.dart';
import 'package:flutter_application_10/dashbord/widget/GraduateTableHelper.dart';
import 'package:flutter_application_10/dashbord/widget/addbutton.dart';

class GraduateControlPage extends StatefulWidget {
  const GraduateControlPage({super.key});

  @override
  State<GraduateControlPage> createState() => _GraduateControlPageState();
}

class _GraduateControlPageState extends State<GraduateControlPage> {
  List<Map<String, String>> graduates = [
    {
      'name': 'أحمد محمد',
      'id': '20201001',
      'department': 'علوم الحاسب',
      'gpa': '4.5',
      'graduationYear': '2024',
      'email': 'ahmed@example.com',
    },
    {
      'name': 'سارة خالد',
      'id': '20201002',
      'department': 'نظم معلومات',
      'gpa': '4.8',
      'graduationYear': '2023',
      'email': 'sarah@example.com',
    },
  ];
  // void _addGraduate() {
  //   final TextEditingController nameController = TextEditingController();
  //   final TextEditingController idController = TextEditingController();
  //   final TextEditingController deptController = TextEditingController();
  //   final TextEditingController gpaController = TextEditingController();
  //   final TextEditingController yearController = TextEditingController();
  //   final TextEditingController emailController = TextEditingController();

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('إضافة خريج جديد'),
  //       content: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             TextField(
  //                 controller: nameController,
  //                 decoration: const InputDecoration(labelText: 'الاسم')),
  //             TextField(
  //                 controller: idController,
  //                 decoration:
  //                     const InputDecoration(labelText: 'الرقم الجامعي')),
  //             TextField(
  //                 controller: deptController,
  //                 decoration: const InputDecoration(labelText: 'القسم')),
  //             TextField(
  //                 controller: gpaController,
  //                 decoration: const InputDecoration(labelText: 'المعدل')),
  //             TextField(
  //                 controller: yearController,
  //                 decoration: const InputDecoration(labelText: 'سنة التخرج')),
  //             TextField(
  //                 controller: emailController,
  //                 decoration:
  //                     const InputDecoration(labelText: 'البريد الإلكتروني')),
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text('إلغاء')),
  //         ElevatedButton(
  //           onPressed: () {
  //             setState(() {
  //               graduates.add({
  //                 'name': nameController.text,
  //                 'id': idController.text,
  //                 'department': deptController.text,
  //                 'gpa': gpaController.text,
  //                 'graduationYear': yearController.text,
  //                 'email': emailController.text,
  //               });
  //             });
  //             Navigator.pop(context);
  //           },
  //           child: const Text('إضافة'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _editGraduate(int index) {
  //   final grad = graduates[index];
  //   final TextEditingController nameController =
  //       TextEditingController(text: grad['name']);
  //   final TextEditingController idController =
  //       TextEditingController(text: grad['id']);
  //   final TextEditingController deptController =
  //       TextEditingController(text: grad['department']);
  //   final TextEditingController gpaController =
  //       TextEditingController(text: grad['gpa']);
  //   final TextEditingController yearController =
  //       TextEditingController(text: grad['graduationYear']);
  //   final TextEditingController emailController =
  //       TextEditingController(text: grad['email']);

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('تعديل بيانات الخريج'),
  //       content: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             TextField(
  //                 controller: nameController,
  //                 decoration: const InputDecoration(labelText: 'الاسم')),
  //             TextField(
  //                 controller: idController,
  //                 decoration:
  //                     const InputDecoration(labelText: 'الرقم الجامعي')),
  //             TextField(
  //                 controller: deptController,
  //                 decoration: const InputDecoration(labelText: 'القسم')),
  //             TextField(
  //                 controller: gpaController,
  //                 decoration: const InputDecoration(labelText: 'المعدل')),
  //             TextField(
  //                 controller: yearController,
  //                 decoration: const InputDecoration(labelText: 'سنة التخرج')),
  //             TextField(
  //                 controller: emailController,
  //                 decoration:
  //                     const InputDecoration(labelText: 'البريد الإلكتروني')),
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text('إلغاء')),
  //         ElevatedButton(
  //           onPressed: () {
  //             setState(() {
  //               graduates[index] = {
  //                 'name': nameController.text,
  //                 'id': idController.text,
  //                 'department': deptController.text,
  //                 'gpa': gpaController.text,
  //                 'graduationYear': yearController.text,
  //                 'email': emailController.text,
  //               };
  //             });
  //             Navigator.pop(context);
  //           },
  //           child: const Text('حفظ'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _deleteGraduate(int index) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('تأكيد الحذف'),
  //       content: const Text('هل أنت متأكد أنك تريد حذف هذا الخريج؟'),
  //       actions: [
  //         TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text('إلغاء')),
  //         ElevatedButton(
  //           onPressed: () {
  //             setState(() {
  //               graduates.removeAt(index);
  //             });
  //             Navigator.pop(context);
  //           },
  //           style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
  //           child: const Text('حذف'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(' التحكم بالخريجين'),
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('إضافة خريج '),
            onPressed:
                // _addGraduate,
                () {
              showDialog(
                context: context,
                builder: (_) => AddGraduateDialog(
                  onAdd: (newGraduate) {
                    setState(() {
                      graduates.add(newGraduate);
                      // filteredGraduates = [...allGraduates];
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: GraduateTableHelper.buildColumns(isMobile),
                      rows: List.generate(graduates.length, (index) {
                        final grad = graduates[index];
                        return GraduateTableHelper.buildRow(
                          grad: grad,
                          index: index,
                          isMobile: isMobile,
                          onEdit: () {
                            showDialog(
                              context: context,
                              builder: (_) => GraduateDialogManager(
                                dialogType: 'edit',
                                graduate: grad,
                                onSave: (updatedGraduate) {
                                  setState(() {
                                    graduates[index] = updatedGraduate;
                                  });
                                },
                                onDelete: () {}, // لن نستخدم الحذف هنا
                              ),
                            );
                          },
                          onDelete: () {
                            showDialog(
                              context: context,
                              builder: (_) => GraduateDialogManager(
                                dialogType: 'delete',
                                graduate: grad,
                                onSave:
                                    (newGraduate) {}, // لن نستخدم التعديل هنا
                                onDelete: () {
                                  setState(() {
                                    graduates.removeAt(index);
                                  });
                                },
                              ),
                            );
                          },
                        );
                      }),
                    ))),
          );
        },
      ),
    );
  }
}
