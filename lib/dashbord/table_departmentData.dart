import 'package:flutter/material.dart';
import 'package:flutter_application_10/dashbord/widget/DepartmentTableHelper.dart';
import 'package:flutter_application_10/dashbord/widget/departmentmangar.dart';

class TableDepartmentdata extends StatefulWidget {
  const TableDepartmentdata({super.key});

  @override
  State<TableDepartmentdata> createState() => _TableDepartmentdataState();
}

class _TableDepartmentdataState extends State<TableDepartmentdata> {
  List<Map<String, String>> departments = [
    {
      'name': 'علوم الحاسوب',
      'college': 'كلية الحاسبات وتقنية المعلومات',
      'head': 'د. أحمد العتيبي',
      'students': "250",
    },
    {
      'name': 'الهندسة الكهربائية',
      'college': 'كلية الهندسة',
      'head': 'د. خالد الزهراني',
      'students': "180",
    },
    {
      'name': 'اللغة الإنجليزية',
      'college': 'كلية الآداب',
      'head': 'د. منى الشمري',
      'students': "320",
    },
    {
      'name': 'القانون العام',
      'college': 'كلية الحقوق',
      'head': 'د. عبدالعزيز القرني',
      'students': '150',
    },
    {
      'name': 'إدارة الأعمال',
      'college': 'كلية العلوم الإدارية',
      'head': 'د. سارة السبيعي',
      'students': "275",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحة التحكم باالاقسام'),
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: Text('إضافة قسم '),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => DepartmentDialogManager(
                  dialogType: 'add',
                  onSave: (newDept) {
                    setState(() {
                      departments.add(newDept);
                    });
                  },
                  onDelete: () {}, // لن نستخدم الحذف هنا
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
                    columns: DepartmentTableHelper.buildColumns(isMobile),
                    rows: List.generate(departments.length, (index) {
                      final dept = departments[index];
                      return DepartmentTableHelper.buildRow(
                        department: dept,
                        index: index,
                        isMobile: isMobile,
                        onEdit: () {
                          // استدعاء دالة تعديل القسم
                          showDialog(
                            context: context,
                            builder: (_) => DepartmentDialogManager(
                              dialogType: 'edit',
                              department: dept,
                              onSave: (updatedDept) {
                                setState(() {
                                  departments[index] = updatedDept;
                                });
                              },
                              onDelete: () {}, // لن نستخدم الحذف هنا
                            ),
                          );
                        },
                        onDelete: () {
                          // استدعاء دالة حذف القسم

                          showDialog(
                            context: context,
                            builder: (_) => DepartmentDialogManager(
                              dialogType: 'delete',
                              department: dept,
                              onSave: (newDept) {}, // لن نستخدم التعديل هنا
                              onDelete: () {
                                setState(() {
                                  departments.removeAt(index);
                                });
                              },
                            ),
                          );
                        },
                      );
                    }),
                  ),
                )),
          );
        },
      ),
    );
  }
}
