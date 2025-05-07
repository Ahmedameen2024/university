import 'package:flutter_application_10/model/modelgraduates.dart';
import 'package:flutter_application_10/model/modelresearch.dart';

class Department {
  final String name;
  final String? description;
  final List<Research> researches;

  Department({
    required this.name,
    this.description,
    List<Graduate>? graduates,
    List<Research>? researches,
  }) : researches = researches ?? [];
}

// قائمة الأقسام + الأبحاث
List<Department> departments = [
  Department(
    name: 'علوم الحاسوب',
    description:
        'قسم يهتم ببرمجة الحاسوب، والذكاء الاصطناعي، وهندسة البرمجيات.',
    researches: [
      Research(
        title: 'أمن المعلومات',
        summary: 'بحث حول تقنيات التشفير والحماية من الاختراق.',
        downloadUrl: 'https://example.com/security.pdf',
        year: '2020',
      ),
      Research(
        title: 'تطبيقات الذكاء الاصطناعي',
        summary: 'دراسة استخدام AI في تشخيص الأمراض.',
        downloadUrl: 'https://example.com/ai-medicine.pdf',
        year: '2020',
      ),
    ],
    // graduates: [
    //   Graduates(name: 'Ahmed', research: 'university', year: '2024'),
    // ],
  ),
  Department(
    name: 'نظم المعلومات',
    description: 'يجمع بين تقنيات الحاسوب وتحليل الأعمال.',
    researches: [
      Research(
        title: 'تحليل نظم المستشفيات',
        summary: 'بحث في تصميم نظام رقمي للمستشفيات.',
        downloadUrl: 'https://example.com/hospital-system.pdf',
        year: '2022',
      ),
    ],
  ),
  Department(
    name: 'الهندسة المدنية',
    description: 'يعنى بتصميم المنشآت والجسور والبنية التحتية.',
    researches: [
      Research(
        title: 'تحليل وتصميم الجسور',
        summary: 'طرق التصميم الحديثة للجسور باستخدام الخرسانة سابقة الإجهاد.',
        downloadUrl: 'https://example.com/bridges.pdf',
        year: '2022',
      ),
    ],
  ),
];
