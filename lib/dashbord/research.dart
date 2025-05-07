import 'package:flutter/material.dart';
import 'package:flutter_application_10/dashbord/widget/research_dialog.dart';

class ResearchControlPage extends StatefulWidget {
  const ResearchControlPage({super.key});

  @override
  State<ResearchControlPage> createState() => _ResearchControlPageState();
}

class _ResearchControlPageState extends State<ResearchControlPage> {
  List<Map<String, dynamic>> researches = [];

  void _addResearch(Map<String, dynamic> research) {
    setState(() => researches.add(research));
  }

  void _editResearch(int index, Map<String, dynamic> updatedResearch) {
    setState(() => researches[index] = updatedResearch);
  }

  void _showAddDialog({Map<String, dynamic>? existingResearch, int? index}) {
    showAddResearchDialog(context, (data) {
      if (existingResearch != null && index != null) {
        _editResearch(index, data);
      } else {
        _addResearch(data);
      }
    }, existingResearch: existingResearch);
  }

  void _deleteResearch(int index) {
    setState(() => researches.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة الأبحاث'),
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('إضافة ابحاث'),
            onPressed: () => _showAddDialog(),
          )
        ],
      ),
      body: researches.isEmpty
          ? const Center(child: Text('لا توجد أبحاث حالياً'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: researches.length,
              itemBuilder: (context, index) {
                final research = researches[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('العنوان: ${research['title']}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('المشرف: ${research['supervisor']}'),
                        Text('القسم: ${research['department']}'),
                        if (research['team'] != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Text('الفريق البحثي:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Wrap(
                                spacing: 10,
                                runSpacing: 6,
                                children: List.generate(
                                    (research['team'] as List).length, (i) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(research['team'][i]),
                                  );
                                }),
                              ),
                            ],
                          ),
                        if (research['file'] != null) ...[
                          const SizedBox(height: 8),
                          Text('الملف: ${research['file'].split('/').last}',
                              style: const TextStyle(color: Colors.green)),
                        ],
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _showAddDialog(
                                  existingResearch: research, index: index),
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
                                      //   // onPressed: () => Navigator.pop(context),
                                      // ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () {
                                          _deleteResearch(index);
                                          // Navigator.of(context).pop();
                                        },
                                        child: const Text('حذف'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
