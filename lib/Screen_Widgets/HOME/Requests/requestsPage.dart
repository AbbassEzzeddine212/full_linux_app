import 'package:flutter/material.dart';

import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';

import '../../../constant/Dimensions.dart';


import '../../Navigation_Pages/controller.dart';
import '../NewRequestPage/NewRequest_Page.dart';
import 'WIdgets/IssuesCatigories.dart';
import 'WIdgets/SwitchLists.dart';

class Requests extends StatelessWidget {
  Requests({super.key});

  final NavigationController navController = Get.find<NavigationController>(); // <-- Add this

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
    ),
    IssueCategory(
      'General issues',
      Icons.description,
          () => Get.to(() => NewrequestPage(issueType: 'General issues')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Requests',
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            navController.goBack(); // ⬅️ Go back in the navigation stack
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              heightFactor: 2,
              child: Text(
                'Report New issue',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DimensionsApp.width * 0.04,
                vertical: DimensionsApp.height * 0.02,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.7,
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
      ),
    );
  }
}