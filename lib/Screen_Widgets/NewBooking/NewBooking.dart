import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/MyBooking/MyBooking.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class Newbooking extends StatelessWidget {
  const Newbooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Booking'),
      body: Stack(
        children: [
              InkWell(
                onTap: ()=>Get.to(Mybooking()),
                child:  Container(
                  width: 550,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/images/newbooking.png'),
                      fit: BoxFit.cover, // cover, contain, fill, etc.
                    ),
                  ),
                ),
              )

        ],
      ),
    );
  }
}
