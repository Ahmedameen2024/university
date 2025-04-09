import 'package:flutter/material.dart';
import 'package:flutter_application_10/shard/app_colors.dart';

class TablGriduintdata extends StatefulWidget {
  const TablGriduintdata({super.key});

  @override
  State<TablGriduintdata> createState() => _TableCollagedataState();
}

class _TableCollagedataState extends State<TablGriduintdata> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.bgcolor, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const Divider(thickness: 0.5, color: Colors.green),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            //HeaderTable
            TableRow(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.green, width: 0.5),
                  ),
                ),
                children: [
                  tableHedar('Name'),
                  tableHedar('User_Name'),
                  tableHedar('Email'),
                  tableHedar('Phone'),
                  tableHedar('Collage'),
                  tableHedar('Deparment'),
                  tableHedar('Address'),
                  tableHedar('Opreations'),
                ]),
            //Data Table

            tabblRow(
              context,
              name: 'Ahmed Ameen Ahmed',
              username: 'Ahmed',
              // image: 'images/كلية الطب .png',
              emaill: 'AAAAA',
              phone: '7144',
              department: 'Computer',
              collage: 'Dr.jamal AL Ameri',
              address: ' Taze_Alomast_INyosaf aqa',
            )
          ],
        )
      ]),
    );
  }

  TableRow tabblRow(
    context, {
    name,
    username,
    emaill,
    phone,
    // image,
    department,
    collage,
    address,
  }) {
    return TableRow(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.green, width: 0.5),
          ),
        ),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(1000),
                //   child: Image.asset(
                //     "$image",
                //     // height: 40,
                //     width: 60,
                //   ),
                // ),
                Text(name),

                // Text(name),
              ],
            ),
          ),
          Text(username),
          Text(emaill),
          Text(phone),
          Row(
            children: [
              Text(collage),
              // Container(
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle, color: AppColors.maincolor),
              //     height: 10,
              //     width: 10),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          Text(department),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(1000),
                //   child: Image.asset(
                //     "$image",
                //     // height: 40,
                //     width: 60,
                //   ),
                // ),
                Text(address),

                // Text(name),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              const Icon(Icons.more_vert),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          )
        ]);
  }

  Widget tableHedar(text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
