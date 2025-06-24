import 'package:flutter/material.dart';
import 'package:full_app/constant/Colors.dart';

class AppTheme {
  // LightMood
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(color: AppColors.Appbar, centerTitle: true),
      iconTheme: IconThemeData(color: Colors.black)
    );
  }

  //DarkMood
}
