class Graduate {
  final String name;
  final String research;
  final String year;

  Graduate({required this.name, required this.research, required this.year});


}


// class Graduate {
//   final String id;
//   final String name;
//   final String department;
//   final String gpa;
//   final String graduationYear;
//   final String email;

//   Graduate({
//     required this.id,
//     required this.name,
//     required this.department,
//     required this.gpa,
//     required this.graduationYear,
//     required this.email,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'department': department,
//       'gpa': gpa,
//       'graduationYear': graduationYear,
//       'email': email,
//     };
//   }

//   factory Graduate.fromMap(Map<String, dynamic> map, String documentId) {
//     return Graduate(
//       id: map['id'],
//       name: map['name'],
//       department: map['department'],
//       gpa: map['gpa'],
//       graduationYear: map['graduationYear'],
//       email: map['email'],
//     );
//   }
// }
