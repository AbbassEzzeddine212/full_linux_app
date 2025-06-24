import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/Home.dart';
import 'package:full_app/Screen_Widgets/Navigation_Pages/NavigationPages.dart';
import 'package:full_app/constant/App_Theme.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:AppTheme.lightTheme,
      home: NavigationPages(),
    );
  }
}


