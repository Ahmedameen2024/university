// import 'package:flutter/material.dart';
// import 'package:flutter_application_10/constant/nav_controller.dart';
// import 'package:flutter_application_10/screen/chat_screen.dart';
// import 'package:flutter_application_10/screen/collage.dart';
// import 'package:flutter_application_10/screen/job.dart';
// import 'package:flutter_application_10/them/darkthem.dart';
// import 'package:flutter_application_10/them/lightthem.dart';
// import 'package:flutter_application_10/widget/custom_app_bar.dart';
// import 'package:get/get.dart';

// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // final NavController navController = Get.put(NavController());

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   // final NavController navController = Get.find();
//   final List<Widget> pages = [
//     Center(child: ChatScreen()),
//     Center(child: FacultiesPage()),
//     Center(child: Jobs()),
//     Center(child: Text('Servecs')),
//     Center(child: Text('profial')),
//     Center(child: Text('login')),
//     Center(child: Text('logout')),
//   ];

//   final List<BottomNavigationBarItem> bottomNavItems = [
//     BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chat'),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.account_balance), label: 'collage'),
//     BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jop'),
//     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'serveces'),
//     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profial'),
//     BottomNavigationBarItem(icon: Icon(Icons.login), label: 'login'),
//     BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'logout')
//   ];

//   ThemeData appThem = lightTheme;
//   void _changeTheme() {
//     setState(() {
//       if (appThem == lightTheme) {
//         appThem = darkTheme;
//       } else {
//         appThem = lightTheme;
//       }
//     });
//   }

//   // bool isLargeScreen(BuildContext context) {
//   @override
//   Widget build(BuildContext context) {
//     // final bool largeScreen = isLargeScreen(context);

//     // return DefaultTabController(
//     //     length: 4,
//     //     child: Scaffold(
//     //       key: _scaffoldKey,
//     //       appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
//     //       drawer: largeScreen ? null : buildDrawer(navController),
//     //       body: Row(
//     //         children: [
//     //           if (largeScreen)
//     //             Container(width: 250, child: buildDrawer(navController)),
//     //           Expanded(
//     //             child: Obx(() => pages[navController.currentIndex.value]),
//     //           ),
//     //         ],
//     //       ),
//     //       bottomNavigationBar:
//     //           largeScreen ? null : buildBottomNavigation(navController),
//     //     ));
//     final NavController navController = Get.put(NavController());

//     return Obx(() {
//       bool isWideScreen = MediaQuery.of(context).size.width > 600;

//       return MaterialApp(
//         theme: appThem,
//         home: DefaultTabController(
//           length: 4,
//           child: SafeArea(
//             child: Scaffold(
//               key: _scaffoldKey,
//               appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
//               drawer: isWideScreen ? null : buildDrawer(navController),
//               body: Row(
//                 children: [
//                   if (isWideScreen)
//                     NavigationRail(
//                       backgroundColor: Colors.blue,
//                       selectedIndex: navController.currentIndex.value,
//                       onDestinationSelected: navController.changePage,
//                       labelType: NavigationRailLabelType.all,
//                       destinations: [
//                         NavigationRailDestination(
//                             icon: Icon(Icons.chat), label: Text('Chat')),
//                         NavigationRailDestination(
//                             icon: Icon(Icons.account_balance),
//                             label: Text('Collage')),
//                         NavigationRailDestination(
//                             icon: Icon(Icons.work), label: Text('Jop')),
//                         NavigationRailDestination(
//                             icon: Icon(Icons.settings), label: Text('Servecs')),
//                         NavigationRailDestination(
//                             icon: Icon(Icons.person), label: Text('Profial')),
//                         NavigationRailDestination(
//                             icon: Icon(Icons.login), label: Text('Login')),
//                         NavigationRailDestination(
//                             icon: Icon(Icons.logout), label: Text('Logout'))
//                       ],
//                     ),
//                   Expanded(
//                     child: pages[navController.currentIndex.value],
//                   ),
//                 ],
//               ),
//               bottomNavigationBar:
//                   !isWideScreen ? buildBottomNavigation(navController) : null,
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   Widget buildDrawer(NavController controller) {
//     return Drawer(
//       backgroundColor: Color(0xFF2A2F4F),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(color: Color(0xFF1E2336)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       _changeTheme();
//                     },
//                     icon: Icon(appThem == lightTheme
//                         ? Icons.mode_night
//                         : Icons.sunny)),
//                 const CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 30,
//                   child: Icon(Icons.person, size: 30, color: Colors.grey),
//                 ),
//                 // const SizedBox(height: 10),
//                 // const Text('اسم المستخدم',
//                 //     style: TextStyle(color: Colors.white, fontSize: 18)),
//                 // const Text('@username', style: TextStyle(color: Colors.grey)),
//                 // const SizedBox(height: 10),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.settings, color: Colors.white),
//             title: Text('الإعدادات', style: TextStyle(color: Colors.white)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.info_outline, color: Colors.white),
//             title: Text('حول التطبيق', style: TextStyle(color: Colors.white)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.login, color: Colors.white),
//             title: Text('تسجيل دخول', style: TextStyle(color: Colors.white)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.logout, color: Colors.white),
//             title: Text('تسجيل الخروج', style: TextStyle(color: Colors.white)),
//             onTap: () {
//               Get.to(() => FacultiesPage());
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildBottomNavigation(NavController controller) {
//     return Obx(() => BottomNavigationBar(
//           currentIndex: navController.currentIndex.value,
//           onTap: navController.changePage,
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Color(0xFF2A2F4F), // لون خلفية غامق مثل تيليجرام
//           selectedItemColor: Colors.white, // لون العنصر النشط
//           unselectedItemColor: Colors.grey[400], // لون العناصر غير النشطة
//           showUnselectedLabels: true,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat),
//               label: 'chat',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.school),
//               label: 'collage',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.work),
//               label: 'Jop',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'Servecs',
//             ),
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
// import 'package:flutter_application_10/app_them.dart';
import 'package:flutter_application_10/controll/nav_controller.dart';
import 'package:flutter_application_10/screen/chat_screen.dart';
import 'package:flutter_application_10/screen/collage.dart';
import 'package:flutter_application_10/screen/job.dart';
import 'package:flutter_application_10/screen/sin_up.dart';
import 'package:flutter_application_10/screen/welcom_screen.dart';
import 'package:flutter_application_10/them/darkthem.dart';
import 'package:flutter_application_10/them/lightthem.dart';
import 'package:flutter_application_10/widget/BottomNavigation.dart';
import 'package:flutter_application_10/widget/custom_app_bar.dart';
import 'package:flutter_application_10/widget/drawer.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  // Home(BuildContext context);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NavController navController = Get.put(NavController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ThemeData appTheme = lightTheme;

  // الصفحات الأساسية
  final List<Widget> phonePages = [
    ChatScreen(),
    FacultiesPage(),
    Jobs(),
    Center(child: Text('Services')),
  ];

  final List<Widget> desktopPages = [
    ChatScreen(),
    FacultiesPage(),
    Jobs(),
    Center(child: Text('Services')),
    Center(child: Text('Profile')),
    SinUp(),
    WelcomScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navController.currentPage.value = ChatScreen(); // ✅ آمن الآن
    });
  }

  void _changeTheme() {
    setState(() {
      appTheme = (appTheme == lightTheme) ? darkTheme : lightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
          drawer: isWideScreen ? null : AppDrawer(changeThem: _changeTheme),
          body: Row(
            children: [
              if (isWideScreen) buildNavigationRail(),
              Expanded(
                child: navController.currentPage.value,
              ),
            ],
          ),
          bottomNavigationBar:
              !isWideScreen ? Bottomnavigation(phonePage: phonePages) : null,
        ),
      );
    });
  }

  // Widget buildDrawer() {
  //   return Drawer(
  //     // backgroundColor: Color(0xFF2A2F4F),
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: [
  //         DrawerHeader(
  //           decoration: BoxDecoration(color: Color(0xFF1E2336)),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               IconButton(
  //                 onPressed: _changeTheme,
  //                 icon: Icon(
  //                     appTheme == lightTheme ? Icons.mode_night : Icons.sunny),
  //               ),
  //               const CircleAvatar(
  //                 backgroundColor: Colors.white,
  //                 radius: 30,
  //                 child: Icon(Icons.person, size: 30, color: Colors.grey),
  //               ),
  //             ],
  //           ),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.settings, color: Colors.white),
  //           title: Text('الإعدادات', style: TextStyle(color: Colors.white)),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.info_outline, color: Colors.white),
  //           title: Text('حول التطبيق', style: TextStyle(color: Colors.white)),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.login, color: Colors.white),
  //           title: Text('تسجيل دخول', style: TextStyle(color: Colors.white)),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.logout, color: Colors.white),
  //           title: Text('تسجيل الخروج', style: TextStyle(color: Colors.white)),
  //           onTap: () {
  //             navController.currentPage.value =
  //                 FacultiesPage(); // مثال على التنقل
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget buildBottomNavigation() {
  //   return BottomNavigationBar(
  //     currentIndex: navController.selectedPhoneIndex.value,
  //     onTap: (index) {
  //       navController.selectedPhoneIndex.value = index;
  //       navController.currentPage.value = phonePages[index];
  //     },
  //     type: BottomNavigationBarType.fixed,
  //     // backgroundColor: Color(0xFF2A2F4F),
  //     // selectedItemColor: Colors.white,
  //     // unselectedItemColor: Colors.grey[400],
  //     showUnselectedLabels: true,
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
  //       BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Collage'),
  //       BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Job'),
  //       BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Services'),
  //     ],
  //   );
  // }

  Widget buildNavigationRail() {
    return Container(
      width: 120,
      color: Colors.blue,
      child: ListView(
        children: [
          buildRailItem(Icons.chat, 'Chat', 0),
          buildRailItem(Icons.school, 'Collage', 1),
          buildRailItem(Icons.work, 'Job', 2),
          buildRailItem(Icons.settings, 'Services', 3),
          buildRailItem(Icons.person, 'Profile', 4),
          buildRailItem(Icons.login, 'Login', 5),
          buildRailItem(Icons.logout, 'Logout', 6),
        ],
      ),
    );
  }

  Widget buildRailItem(IconData icon, String label, int index) {
    return ListTile(
      leading: Icon(icon,
          color: navController.selectedDesktopIndex.value == index
              ? Colors.white
              : Colors.white54),
      title: Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      selected: navController.selectedDesktopIndex.value == index,
      selectedTileColor: Colors.black26,
      onTap: () {
        navController.selectedDesktopIndex.value = index;
        navController.currentPage.value = desktopPages[index];
      },
    );
  }
}

// Widget buildNavigationRail() {
//   return Container(
//     width: 80,
//     color: Colors.blue,
//     child: ListView(
//       children: List.generate(desktopPages.length, (index) {
//         final icons = [
//           Icons.chat,
//           Icons.school,
//           Icons.work,
//           Icons.settings,
//           Icons.person,
//           Icons.login,
//           Icons.logout
//         ];

//         final labels = [
//           'Chat',
//           'Collage',
//           'Job',
//           'Services',
//           'Profile',
//           'Login',
//           'Logout'
//         ];

//         return Obx(() => ListTile(
//               leading: Icon(
//                 icons[index],
//                 color: navController.selectedDesktopIndex.value == index
//                     ? Colors.white
//                     : Colors.white70,
//               ),
//               title: Text(
//                 labels[index],
//                 style: TextStyle(
//                   color: navController.selectedDesktopIndex.value == index
//                       ? Colors.white
//                       : Colors.white70,
//                   fontSize: 12,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               selected: navController.selectedDesktopIndex.value == index,
//               selectedTileColor: Colors.black26,
//               onTap: () {
//                 navController.selectedDesktopIndex.value = index;
//                 navController.currentPage.value = desktopPages[index];
//               },
//             ));
//       }),
//     ),
//   );
// }
