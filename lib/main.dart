import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Navigation_Pages/NavigationPages.dart';
import 'package:full_app/constant/App_Theme.dart';
import 'package:get/get.dart';

import 'constant/Dimensions.dart';

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
      home:Builder(
        builder: (context) {
          DimensionsApp.init(context); // ✅ init here once
          return NavigationPages(); // your main screen
        },
      ),
    );
  }
}
// NavigationPages(),

