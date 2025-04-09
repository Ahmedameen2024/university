import 'package:flutter/material.dart';
import 'package:flutter_application_10/shard/app_colors.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColors.bgsidemenu,
        // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text('Control Panal',
                  style: TextStyle(
                      color: AppColors.fontcolormain,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            Drowerlist(
              icon: const Icon(Icons.dashboard),
              title: 'Dashbord',
              press: () {},
            ),
            Drowerlist(
              icon: const Icon(Icons.group),
              title: 'Admnis',
              press: () {},
            ),
            Drowerlist(
              icon: const Icon(Icons.food_bank),
              title: 'collage',
              press: () {},
            ),
            Drowerlist(
              icon: const Icon(Icons.school),
              title: 'Grduints',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Drowerlist extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback press;

  const Drowerlist(
      {super.key,
      required this.title,
      required this.icon,
      required this.press});

  // const Drowerlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      onTap: press,
    );
  }
}
