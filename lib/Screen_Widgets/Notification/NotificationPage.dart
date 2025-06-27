import 'package:flutter/material.dart';
import 'package:full_app/constant/Colors.dart';



class NotiPage extends StatelessWidget {
  const NotiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: AppColors.Appbar,
      )
    );
  }
}
