// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class AddJobPage extends StatefulWidget {
//   const AddJobPage({super.key});

//   @override
//   State<AddJobPage> createState() => _AddJobPageState();
// }

// class _AddJobPageState extends State<AddJobPage> {
//   TextEditingController jobTitleController = TextEditingController();
//   TextEditingController jobDescriptionController = TextEditingController();
//   TextEditingController jobRequirementsController = TextEditingController();
//   String? selectedFilePath;

//   // Method to pick a file
//   void _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'docx', 'txt'], // Example allowed file types
//     );

//     if (result != null) {
//       setState(() {
//         selectedFilePath = result.files.single.path;
//       });
//     }
//   }

//   // Method to save the job
//   void _saveJob() {
//     String jobTitle = jobTitleController.text;
//     String jobDescription = jobDescriptionController.text;
//     String jobRequirements = jobRequirementsController.text;

//     if (jobTitle.isNotEmpty && jobDescription.isNotEmpty && jobRequirements.isNotEmpty) {
//       // You can add your logic to save the job data here, for example, saving to Firebase or a local database
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text('تمت إضافة الوظيفة بنجاح'),
//           content: const Text('تم حفظ بيانات الوظيفة بنجاح.'),
//           actions: [
//             TextButton(
//               child: const Text('إغلاق'),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       );
//     } else {
//       // Show an error if fields are empty
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('الرجاء ملء جميع الحقول')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('إضافة وظيفة جديدة'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextField(
//                 controller: jobTitleController,
//                 decoration: const InputDecoration(
//                   labelText: 'اسم الوظيفة',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: jobDescriptionController,
//                 maxLines: 5,
//                 decoration: const InputDecoration(
//                   labelText: 'وصف الوظيفة',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: jobRequirementsController,
//                 maxLines: 3,
//                 decoration: const InputDecoration(
//                   labelText: 'المتطلبات',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _pickFile,
//                 child: const Text('رفع مستند الوظيفة'),
//               ),
//               if (selectedFilePath != null) ...[
//                 const SizedBox(height: 10),
//                 Text('تم اختيار الملف: ${selectedFilePath?.split('/').last ?? ""}'),
//               ],
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _saveJob,
//                 child: const Text('حفظ الوظيفة'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({super.key});

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  List<Map<String, dynamic>> jobs = [];

  void _showJobDialog({Map<String, dynamic>? existingJob, int? index}) {
    final TextEditingController jobTitleController =
        TextEditingController(text: existingJob?['title'] ?? '');
    final TextEditingController jobDescriptionController =
        TextEditingController(text: existingJob?['description'] ?? '');
    final TextEditingController jobRequirementsController =
        TextEditingController(text: existingJob?['requirements'] ?? '');
    String? selectedFilePath = existingJob?['file'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'إضافة وظيفة' : 'تعديل وظيفة'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: jobTitleController,
                  decoration: const InputDecoration(labelText: 'اسم الوظيفة'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: jobDescriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'وصف الوظيفة'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: jobRequirementsController,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: 'المتطلبات'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'docx', 'txt'],
                    );
                    if (result != null) {
                      selectedFilePath = result.files.single.path;
                      setState(() {}); // refresh state to update file label
                    }
                  },
                  child: const Text('رفع مستند'),
                ),
                if (selectedFilePath != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'تم اختيار: ${selectedFilePath?.split('/').last}',
                      style: const TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ),
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
                final newJob = {
                  'title': jobTitleController.text,
                  'description': jobDescriptionController.text,
                  'requirements': jobRequirementsController.text,
                  'file': selectedFilePath,
                };

                if (index == null) {
                  setState(() {
                    jobs.add(newJob);
                  });
                } else {
                  setState(() {
                    jobs[index] = newJob;
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }

  void _deleteJob(int index) {
    setState(() {
      jobs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة الوظائف'), actions: [
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('إضافة وظيفة'),
          onPressed: () => _showJobDialog(),
        ),
      ]),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(job['title']),
                    subtitle: Text(
                      'الوصف: ${job['description']}\nالمتطلبات: ${job['requirements']}\nالملف: ${job['file']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () =>
                              _showJobDialog(existingJob: job, index: index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('تأكيد الحذف'),
                                content: const Text(
                                    'هل أنت متأكد من حذف هذا البحث؟'),
                                actions: [
                                  // TextButton(
                                  //   child: const Text('إلغاء'),
                                  //   onPressed: () => Navigator.pop(context),
                                  // ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      _deleteJob(index);
                                      // Navigator.pop(context);
                                    },
                                    child: const Text('حذف'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
