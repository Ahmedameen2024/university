import 'package:flutter/material.dart';
import 'package:flutter_application_10/shard/app_colors.dart';

class TableDepartmentdata extends StatefulWidget {
  const TableDepartmentdata({super.key});

  @override
  State<TableDepartmentdata> createState() => _TableCollagedataState();
}

class _TableCollagedataState extends State<TableDepartmentdata> {
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
              'Department Data',
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
                  // tableHedar('Department'),
                  tableHedar('Department Name'),
                  tableHedar('Department Dean'),
                  tableHedar(''),
                ]),
            //Data Table
            tabblRow(context,
                // department: 10,
                name: 'الطب',
                image: 'images/كلية الطب .png',
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                // department: 10,
                name: 'الهندسةوتقنيةالمعلومات',
                image: 'images/كلية العلوم الإدارية .png',
                dean: 'Ahmed'),
            tabblRow(context,
                name: 'العلوم التطبيقية',
                image: 'images/كلية العلوم التطبيقية .png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                name: 'العلوم الإدارية',
                image: 'images/managmentscinecie.png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                name: 'الحقوق',
                image: 'images/كلية الحقوق.png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                name: 'الأداب',
                image:
                    'images/png-transparent-paper-ink-fountain-pen-ballpoint-pen-pen-and-ink-ink-textile-cosmetics-thumbnail.png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                name: 'التربية',
                image: 'images/كلية التربية ٣.png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                name: 'اللغات والترجمة',
                image: 'images/اللغات والترجمة .png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                name: 'الحاسب الالي',
                image: 'images/الحاسب الآلي .png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
            tabblRow(context,
                name: 'التعليم المستمر',
                image: 'images/كلية العلوم الإدارية .png',
                // department: 10,
                dean: 'Dr.jamal AL Ameri'),
          ],
        )
      ]),
    );
  }

  TableRow tabblRow(
    context, {
    name,
    image,
    department,
    dean,
  }) {
    return TableRow(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.green, width: 0.5),
          ),
        ),
        children: [
          // Text('$department'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(
                    "$image",
                    // height: 40,
                    width: 60,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(name),
              ],
            ),
          ),
          Row(
            children: [
              // Container(
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle, color: AppColors.maincolor),
              //     height: 10,
              //     width: 10),
              const SizedBox(
                width: 10,
              ),
              Text(dean)
            ],
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
