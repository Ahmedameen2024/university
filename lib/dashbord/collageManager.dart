// import 'package:flutter/material.dart';

// class Collagemanager extends StatelessWidget {
//   final Map<String, String>? collage;
//   final Function(Map<String, String>) onSave;
//   final Function onDelete;
//   final String dialogType; // "add", "edit", "delete"

//   Collagemanager({
//     Key? key,
//     this.collage,
//     required this.onSave,
//     required this.onDelete,
//     required this.dialogType,
//   }) : super(key: key);

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController deanController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController departmentCountController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // If it's editing, populate the fields with existing department data
//     if (dialogType == 'edit' && collage != null) {
//       nameController.text = collage!['name'] ?? '';
//       deanController.text = collage!['dean'] ?? '';
//       passwordController.text = collage!['password'] ?? '';
//       departmentCountController.text = collage!['departments'] ?? '';
//     }

//     return AlertDialog(
//       title: Text(dialogType == 'add'
//           ? 'Add Collage '
//           : dialogType == 'edit'
//               ? 'Edit collage '
//               : 'تأكيد الحذف'),
//       content: dialogType == 'delete'
//           ? Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('هل أنت متأكد من حذف الكلية ${collage?['name'] ?? ''}?'),
//               ],
//             )
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   _buildField(' اسم الكلية ', nameController),
//                   _buildField(' العميد', deanController),
//                   _buildField('كلمة المرور ', passwordController),
//                   _buildField('عدد الاقسام', departmentCountController),
//                 ],
//               ),
//             ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('إلغاء'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             if (dialogType == 'add' || dialogType == 'edit') {
//               final updatedDept = {
//                 'name': nameController.text,
//                 'dean': deanController.text,
//                 'password': passwordController.text,
//                 'departments': departmentCountController.text,
//               };
//               onSave(updatedDept);
//             } else if (dialogType == 'delete') {
//               onDelete();
//             }
//             Navigator.pop(context);
//           },
//           child: dialogType == 'delete'
//               ? const Text('حذف')
//               : dialogType == 'edit'
//                   ? const Text('حفظ')
//                   : const Text('إضافة'),
//         ),
//       ],
//     );
//   }

//   Widget _buildField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.orange, width: 1),
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue, width: 2),
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class Collagemanager extends StatefulWidget {
  final Map<String, dynamic>? collage;
  final Function(Map<String, dynamic>) onSave;
  final Function onDelete;
  final String dialogType; // "add", "edit", "delete"

  const Collagemanager({
    Key? key,
    this.collage,
    required this.onSave,
    required this.onDelete,
    required this.dialogType,
  }) : super(key: key);

  @override
  State<Collagemanager> createState() => _CollagemanagerState();
}

class _CollagemanagerState extends State<Collagemanager> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController deanController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController departmentCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.dialogType == 'edit' && widget.collage != null) {
      nameController.text = widget.collage!['name'] ?? '';
      deanController.text = widget.collage!['dean'] ?? '';
      passwordController.text = widget.collage!['password'] ?? '';
      departmentCountController.text = widget.collage!['departments'] ?? '';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    deanController.dispose();
    passwordController.dispose();
    departmentCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.dialogType == 'add'
          ? 'إضافة كلية جديدة'
          : widget.dialogType == 'edit'
              ? 'تعديل بيانات الكلية'
              : 'تأكيد الحذف'),
      content: widget.dialogType == 'delete'
          ? Text('هل أنت متأكد من حذف الكلية "${widget.collage?['name'] ?? ''}"؟')
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildField('اسم الكلية', nameController),
                  _buildField('اسم العميد', deanController),
                  _buildField('كلمة المرور', passwordController),
                  _buildField('عدد الأقسام', departmentCountController, inputType: TextInputType.number),
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
            if (widget.dialogType == 'delete') {
              widget.onDelete();
              Navigator.pop(context);
              return;
            }

            if (nameController.text.isEmpty ||
                deanController.text.isEmpty ||
                passwordController.text.isEmpty ||
                departmentCountController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('يرجى تعبئة جميع الحقول')),
              );
              return;
            }

            final collageData = {
              'name': nameController.text,
              'dean': deanController.text,
              'password': passwordController.text,
              'departments': departmentCountController.text,
            };

            widget.onSave(collageData);
            Navigator.pop(context);
          },
          child: Text(
            widget.dialogType == 'delete'
                ? 'حذف'
                : widget.dialogType == 'edit'
                    ? 'حفظ'
                    : 'إضافة',
          ),
        ),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller, {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
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
