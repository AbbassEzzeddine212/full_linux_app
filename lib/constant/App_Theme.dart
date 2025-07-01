import 'package:flutter/material.dart';
import 'package:full_app/constant/Colors.dart';

class AppTheme {
  // LightMood
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(color: AppColors.Appbar, centerTitle: true),
      iconTheme: IconThemeData(color: Colors.black, size: 21),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(

          foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
          textStyle: WidgetStatePropertyAll<TextStyle>(
            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(AppColors.Appbar),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
           borderSide: BorderSide(color: Colors.grey,)
         )
      )
    );
  }

  //DarkMood
}
