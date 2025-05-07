// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_application_10/screen/home.dart';
import 'package:flutter_application_10/widget/my_button.dart';
import 'package:flutter_application_10/screen/chat_screen.dart';
import 'package:flutter_application_10/screen/VerificationScreen.dart';

// class SinUp extends StatefulWidget {
//   static const String sinUpScreenRout = 'SinUp';
//   const SinUp({super.key});

//   @override
//   State<SinUp> createState() => _SinUpState();
// }

// class _SinUpState extends State<SinUp> {
//   late String? userName;
//   late String? passwordAccount;
//   late String? email;
//   late String? password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back)),
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         child: SingleChildScrollView(

//           // physics: BouncingScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 100,
//                 child: Image.asset('images/كلية الطب .png'),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               TextField(

//                 textAlign: TextAlign.center,
//                 onChanged: (val) {
//                   userName = val;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'User name',
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange, width: 1),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 onChanged: (val) {
//                   passwordAccount = val;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Create password',
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange, width: 1),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 onChanged: (val) {
//                   email = val;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Enter your Email',
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange, width: 1),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 onChanged: (val) {
//                   password = val;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Enter your password',
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.orange, width: 1),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               MyButton(
//                   color: Colors.blue[800]!,
//                   titel: 'Regesster',
//                   onPressed: () {
//                     // Navigator.of(context).push(
//                     //     MaterialPageRoute(builder: (context) => Home()));
//                     // print(userName);
//                     // print(email);
//                     // print(password);
//                     // print(passwordAccount);
//                     // Navigator.pushNamed(
//                     //   context,
//                     //   Home_page.home_pageControScreenRout,
//                     //   // arguments: [userName, email, password],
//                     // );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SinUp extends StatefulWidget {
  static const String SinUpScreenRoute = 'SinUp';
  const SinUp({super.key});

  @override
  State<SinUp> createState() => _SinUpState();
}

class _SinUpState extends State<SinUp> {
  String userName = '';
  String email = '';
  String password = '';
  bool mounted = true;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('images/كلية الطب .png'),
            ),
            const SizedBox(height: 50),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (val) => userName = val,
              decoration: InputDecoration(
                hintText: 'User name',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (val) => email = val,
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (val) => password = val,
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MyButton(
              color: Colors.blue[800]!,
              title: 'Register',
              onPressed: () async {
                try {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  );

                  if (userName.isEmpty || email.isEmpty || password.isEmpty) {
                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                    return;
                  }

                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  if (userCredential.user == null) {
                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User creation failed')),
                      );
                    }
                    return;
                  }

                  await _firestore
                      .collection('Users')
                      .doc(userCredential.user!.uid)
                      .set({
                    'uid': userCredential.user!.uid,
                    'userName': userName,
                    'email': email,
                    'password': password,
                    'createdAt': FieldValue.serverTimestamp(),
                  });

                  await userCredential.user!.sendEmailVerification();

                  if (mounted) {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  }
                } on FirebaseAuthException catch (e) {
                  if (mounted) {
                    Navigator.pop(context);
                    String errorMessage = 'Registration failed';
                    switch (e.code) {
                      case 'weak-password':
                        errorMessage = 'Password must be at least 6 characters';
                        break;
                      case 'email-already-in-use':
                        errorMessage = 'Email already registered';
                        break;
                      case 'invalid-email':
                        errorMessage = 'Invalid email address';
                        break;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage)),
                    );
                  }
                } catch (e) {
                  if (mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
