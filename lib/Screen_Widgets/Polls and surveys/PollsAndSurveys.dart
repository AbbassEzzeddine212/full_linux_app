import 'package:flutter/material.dart';
import 'package:full_app/constant/MyAppBar.dart';





class PollsAndSurveysPage extends StatelessWidget {
  const PollsAndSurveysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Polls and \nsurveys'),
    );
  }
}
