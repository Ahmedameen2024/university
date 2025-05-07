import 'package:flutter/material.dart';

class DepartmentDialogManager extends StatelessWidget {
  final Map<String, String>? department;
  final Function(Map<String, String>) onSave;
  final Function onDelete;
  final String dialogType; // "add", "edit", "delete"

  DepartmentDialogManager({
    Key? key,
    this.department,
    required this.onSave,
    required this.onDelete,
    required this.dialogType,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController headController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController studentCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // If it's editing, populate the fields with existing department data
    if (dialogType == 'edit' && department != null) {
      nameController.text = department!['name'] ?? '';
      headController.text = department!['head'] ?? '';
      facultyController.text = department!['faculty'] ?? '';
      studentCountController.text = department!['students'] ?? '';
    }

    return AlertDialog(
      title: Text(dialogType == 'add'
          ? 'إضافة قسم'
          : dialogType == 'edit'
              ? 'تعديل القسم'
              : 'تأكيد الحذف'),
      content: dialogType == 'delete'
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('هل أنت متأكد من حذف القسم ${department?['name'] ?? ''}?'),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildField('اسم القسم', nameController),
                  _buildField('رئيس القسم', headController),
                  _buildField('اسم الكلية', facultyController),
                  _buildField('عدد الطلاب', studentCountController),
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
              final updatedDept = {
                'name': nameController.text,
                'head': headController.text,
                'faculty': facultyController.text,
                'students': studentCountController.text,
              };
              onSave(updatedDept);
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
