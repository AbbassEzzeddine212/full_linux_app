import 'package:flutter/material.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';

import '../../Navigation_Pages/controller.dart';



class PollsAndSurveysPage extends StatelessWidget {
  const PollsAndSurveysPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>(); // ✅

    return Scaffold(
      appBar: MyAppBar(
        title: 'Polls and \nsurveys',
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navController.goBack(), // ✅ Go back to previous page
        ),
      ),
      body: const Center(
        child: Text("Polls and surveys content goes here."),
      ),
    );
  }
}