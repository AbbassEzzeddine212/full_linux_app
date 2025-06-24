import 'package:flutter/material.dart';
import 'package:full_app/constant/MyAppBar.dart';



class Mybooking extends StatelessWidget {
  const Mybooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(title: 'My Booking'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 340,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage('assets/images/mybooking.png'),
              fit: BoxFit.cover, // cover, contain, fill, etc.
            ),
          ),
        ),
      ),
    );
  }
}
