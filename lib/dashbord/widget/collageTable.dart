// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

// class CollageTable {
//   static DataRow buildRow({
//     required Map<String, dynamic> collage,
//     required int index,
//     required bool isMobile,
//     required VoidCallback onEdit,
//     required VoidCallback onDelete,
//   }) {
//     return DataRow(cells: [
//       DataCell(Text(
//         collage['name'] ?? '',
//       )),
//       DataCell(Text(collage['dean'] ?? '')),
//       if (!isMobile) DataCell(Flexible(child: Text(collage['password'] ?? ''))),
//       if (!isMobile) DataCell(Text(collage['departments']?.toString() ?? '')),
//       DataCell(Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: onEdit,
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: onDelete,
//           ),
//         ],
//       )),
//     ]);
//   }

//   static List<DataColumn> buildColumns(bool isMobile) {
//     return [
//       const DataColumn(label: Text('الكلية')),
//       const DataColumn(label: Text('العميد ')),
//       if (!isMobile) const DataColumn(label: Text(' كبمة المرور')),
//       if (!isMobile) const DataColumn(label: Text('عدد الاقسام')),
//       const DataColumn(label: Text('تحكم')),
//     ];
//   }
// }


import 'package:flutter/material.dart';

class CollageTable {
  static DataRow buildRow({
    required Map<String, dynamic> collage,
    required String docId, // معرف الوثيقة من Firestore
    required int index,
    required bool isMobile,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return DataRow(cells: [
      DataCell(Text(collage['name'] ?? '')),
      DataCell(Text(collage['dean'] ?? '')),
      if (!isMobile)
        DataCell(SizedBox(
          width: 100,
          child: Text(collage['password'] ?? '', overflow: TextOverflow.ellipsis),
        )),
      if (!isMobile)
        DataCell(Text(collage['departments']?.toString() ?? '')),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      )),
    ]);
  }

  static List<DataColumn> buildColumns(bool isMobile) {
    return [
      const DataColumn(label: Text('الكلية')),
      const DataColumn(label: Text('العميد')),
      if (!isMobile) const DataColumn(label: Text('كلمة المرور')),
      if (!isMobile) const DataColumn(label: Text('عدد الأقسام')),
      const DataColumn(label: Text('تحكم')),
    ];
  }
}
