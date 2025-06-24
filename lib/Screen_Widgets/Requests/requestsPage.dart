import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/NewRequestPage/NewRequest_Page.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'WIdgets/IssuesCatigories.dart';
import 'WIdgets/SwitchLists.dart';

class Requests extends StatelessWidget {
  Requests({super.key});

  final List<IssueCategory> categories = [
    IssueCategory(
      'Electrical Issue',
      Icons.flash_on,
      () => Get.to(() => NewrequestPage(issueType: 'Electrical Issue')),
    ),
    IssueCategory(
      'IT Issues',
      Icons.wifi,
          () => Get.to(() => NewrequestPage(issueType: 'IT Issues')),
    ),
    IssueCategory(
      'Mechanical Issue',
      Icons.build,
          () => Get.to(() => NewrequestPage(issueType: 'Mechanical Issue')),
    ),IssueCategory(
      'General issues',
      Icons.description,
          () => Get.to(() => NewrequestPage(issueType: 'General issues')),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Requests'),
      body: Column(
        children: [
          Center(
            child: Text(
              'Report New issue',
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 8,
                childAspectRatio: 2.5,
                // Slightly wider, flatter look
                physics: NeverScrollableScrollPhysics(),
                children: categories
                    .map((category) => IssueCard(category: category))
                    .toList(),
              ),
            ),
          ),

          Expanded(child: Switchlists()),
        ],
      ),
    );
  }
}
