import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/NewBooking/NewBooking.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/Colors.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Booking'),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
        child: Column(
          spacing: 10,
          children: [
            Center(
              child: Container(
                height: 60,
                width: 250,

                decoration: BoxDecoration(
                  color: AppColors.Appbar,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'My Bookings',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: ()=>Get.to(Newbooking()),
              child: Container(
                width: double.infinity,
                height: 600
                ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/images/booking.png'),
                    fit: BoxFit.cover, // cover, contain, fill, etc.
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
