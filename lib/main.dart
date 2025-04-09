// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_10/pags/widget/chat_screen.dart';
import 'package:flutter_application_10/pags/sin_in.dart';
import 'package:flutter_application_10/pags/sin_ub.dart';
import 'package:flutter_application_10/pags/widget/table_collageData.dart';
import 'package:flutter_application_10/pags/widget/table_departmentData.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_10/control/menu_controller.dart';
import 'package:flutter_application_10/pags/home_page.dart';

import 'package:flutter_application_10/pags/welcom_screen.dart';
import 'package:flutter_application_10/shard/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_10/pags/my_botton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyLarge: TextStyle(color: AppColors.bgsidemenu)),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 192, 173, 224)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: TableCollagedata.TableCollagedataScreenRout,
      routes: {
        WelcomScreen.welcomScreenRout: (context) => const WelcomScreen(),
        SinIn.sinInScreenRout: (context) => const SinIn(),
        SignUp.signUpScreenRoute: (context) => const SignUp(),
        ChatScreen.chatScreenRout: (context) => const ChatScreen(),
        Home_page.home_pageControScreenRout: (context) => const Home_page()
        // TableCollagedata.TableCollagedataScreenRout: (context) =>
        //     const TableCollagedata(),

        // TableCollagedata.TableCollagedataScreenRout: (context) =>
        //     const TableCollagedata(),
      },
    );
  }
}

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // var element;

  getData() async {
    // ignore: non_constant_identifier_names
    CollectionReference CollegesRef =
        FirebaseFirestore.instance.collection('Colleges');
    QuerySnapshot querySnapshot = await CollegesRef.get();
    // ignore: unused_local_variable
    List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
    // ignore: avoid_function_literals_in_foreach_calls

    listDocs.forEach((element) {
      print(element.data());
      print(
          "--------------------------------------------------------------------------");
    });
    // Collegesref.docs.forEach((element));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: const Center(
        child: Text('This is the Test Page'),
      ),
    );
  }
}

// class FirebaseFirstore {
//   static var instance;
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  int _counter = 0;

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return const Scaffold(body: SafeArea(child: TableDepartmentdata()));
  }
}




// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(child: TableCollagedata()),
//     );
//   }
// }




























// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const Test(), // تم التعديل هنا لفتح صفحة Test مباشرة
//     );
//   }
// }

// class Test extends StatefulWidget {
//   const Test({super.key}); // إضافة const وتصحيح البناء

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   List<Map<String, dynamic>> _colleges = []; // تخزين البيانات

//   Future<void> getData() async {
//     try {
//       final collegesRef = FirebaseFirestore.instance.collection('Colleges');

//       final querySnapshot = await collegesRef.get();

//       setState(() {
//         _colleges = querySnapshot.docs
//             .map((doc) => doc.data() as Map<String, dynamic>)
//             .toList();
//       });

//       // طباعة للتحقق
//       for (final college in _colleges) {
//         print(college);
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }

//   @override
//   void initState() {
//     super.initState(); // يجب استدعاء super أولاً
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Colleges List')),
//       body: _colleges.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _colleges.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_colleges[index]['description'] ?? 'No Name'),
//                   subtitle: Text(_colleges[index]['location'] ?? 'Unknown'),
//                 );
//               },
//             ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(child: SignUp()),
//     );
//   }
// }