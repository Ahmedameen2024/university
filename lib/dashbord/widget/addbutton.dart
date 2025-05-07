import 'package:flutter/material.dart';
import 'package:flutter_application_10/widget/my_button.dart'; // تأكد من إضافة MyButton.

class Addbutton {
  static void ShowCustomDilalog({
    required BuildContext context,
    required String title,
    required TextEditingController controller,
    required TextEditingController admin,
    required TextEditingController password,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        titlePadding: const EdgeInsets.symmetric(horizontal: 30),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text Field for "Name collage"
            _buildTextField(controller, 'Name collage'),
            SizedBox(height: 5),
            // Text Field for "Admin Name"
            _buildTextField(admin, 'Admin Name'),
            SizedBox(height: 5),
            // Text Field for "Admin Password"
            _buildTextField(password, 'Admin Password', obscureText: true),
          ],
        ),
        actions: [
          Row(
            children: [
              // Save Button
              MyButton(
                color: Colors.blue,
                title: 'Save',
                onPressed: () {
                  print(controller.text);
                  print(admin.text);
                  print(password.text);
                },
              ),
              Spacer(),
              // Cancel Button
              MyButton(
                color: Colors.red,
                title: 'Cancel',
                onPressed: () {
                  // Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  // Create a reusable TextField widget
  static Widget _buildTextField(
      TextEditingController controller, String labelText,
      {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}

// class Add extends StatefulWidget {
//   const Add({super.key});

//   @override
//   State<Add> createState() => _AddState();
// }

// class _AddState extends State<Add> {
//   void _addGraduate() {
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
//             TextField(controller: nameController, decoration: const InputDecoration(labelText: 'الاسم')),
//             TextField(controller: idController, decoration: const InputDecoration(labelText: 'الرقم الجامعي')),
//             TextField(controller: deptController, decoration: const InputDecoration(labelText: 'القسم')),
//             TextField(controller: gpaController, decoration: const InputDecoration(labelText: 'المعدل')),
//             TextField(controller: yearController, decoration: const InputDecoration(labelText: 'سنة التخرج')),
//             TextField(controller: emailController, decoration: const InputDecoration(labelText: 'البريد الإلكتروني')),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
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

// }

// import 'package:flutter/material.dart';

class AddGraduateDialog extends StatefulWidget {
  final Function(Map<String, String>) onAdd;

  const AddGraduateDialog({super.key, required this.onAdd});

  @override
  State<AddGraduateDialog> createState() => _AddGraduateDialogState();
}

class _AddGraduateDialogState extends State<AddGraduateDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController gpaController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    departmentController.dispose();
    gpaController.dispose();
    yearController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.school),
      iconColor: Colors.black,
      // titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: const Text('إضافة خريج '),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildField('الاسم', nameController),
            _buildField('الرقم الجامعي', idController),
            _buildField('القسم', departmentController),
            _buildField('المعدل', gpaController),
            _buildField('سنة التخرج', yearController),
            _buildField('البريد الإلكتروني', emailController),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onAdd({
              'name': nameController.text,
              'id': idController.text,
              'department': departmentController.text,
              'gpa': gpaController.text,
              'graduationYear': yearController.text,
              'email': emailController.text,
            });
            Navigator.pop(context);
          },
          child: const Text('إضافة'),
        ),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class GraduateDialogManager extends StatelessWidget {
  final Map<String, String>? graduate;
  final Function(Map<String, String>) onSave;
  final Function onDelete;
  final String dialogType; // "add", "edit", "delete"

  GraduateDialogManager({
    Key? key,
    this.graduate,
    required this.onSave,
    required this.onDelete,
    required this.dialogType,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController gpaController = TextEditingController();
  final TextEditingController graduationYearController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // If it's editing, populate the fields with existing graduate data
    if (dialogType == 'edit' && graduate != null) {
      nameController.text = graduate!['name'] ?? '';
      idController.text = graduate!['id'] ?? '';
      departmentController.text = graduate!['department'] ?? '';
      gpaController.text = graduate!['gpa'] ?? '';
      graduationYearController.text = graduate!['graduationYear'] ?? '';
      emailController.text = graduate!['email'] ?? '';
    }

    return AlertDialog(
      title: Text(dialogType == 'add'
          ? 'إضافة خريج'
          : dialogType == 'edit'
              ? 'تعديل الخريج'
              : 'تأكيد الحذف'),
      content: dialogType == 'delete'
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('هل أنت متأكد من حذف الخريج ${graduate?['name'] ?? ''}?'),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildField('الاسم', nameController),
                  _buildField('الرقم الجامعي', idController),
                  _buildField('القسم', departmentController),
                  _buildField('المعدل', gpaController),
                  _buildField('سنة التخرج', graduationYearController),
                  _buildField('البريد الإلكتروني', emailController),
                ],
              ),
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            if (dialogType == 'add' || dialogType == 'edit') {
              final updatedGraduate = {
                'name': nameController.text,
                'id': idController.text,
                'department': departmentController.text,
                'gpa': gpaController.text,
                'graduationYear': graduationYearController.text,
                'email': emailController.text,
              };
              onSave(updatedGraduate);
            } else if (dialogType == 'delete') {
              onDelete();
            }
            Navigator.pop(context);
          },
          child: dialogType == 'delete'
              ? const Text('حذف')
              : dialogType == 'edit'
                  ? const Text('حفظ')
                  : const Text('إضافة'),
        ),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
