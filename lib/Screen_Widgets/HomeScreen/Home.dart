import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Booking/Booking.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/widgets/BarPicture.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/widgets/clickableContainer.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/widgets/sliderContainer.dart';
import 'package:full_app/Screen_Widgets/Requests/requestsPage.dart';
import 'package:full_app/Screen_Widgets/Vists/Vists.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:full_app/main.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Welcome User", leading: Barpicture()),
      body: Wrap(
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Slidercontainer(),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              spacing: 20,
              children: [
                Row(
                  spacing: 40,
                  children: [
                    ClicableContainer(
                      title: 'Requests',
                      icon: Icons.sticky_note_2_sharp,
                      onTap: () {
                        Get.to(Requests());
                      },
                    ),
                    ClicableContainer(
                      title: 'Visits',
                      icon: Icons.edit_calendar_outlined,
                      onTap: () => Get.to(Vists()),
                    ),
                    ClicableContainer(
                      title: 'Booking',
                      icon: Icons.menu_book_outlined,
                      onTap: ()=>Get.to(Booking()),
                    ),
                  ],
                ),
                Row(
                  spacing: 35,
                  children: [
                    ClicableContainer(
                      title: 'Invoices',
                      icon: Icons.credit_card,
                    ),
                    ClicableContainer(title: 'Services', icon: Icons.handyman),
                    ClicableContainer(
                      title: 'News & Events',
                      icon: Icons.sticky_note_2_sharp,
                    ),
                  ],
                ),
                Row(
                  spacing: 35,
                  children: [
                    ClicableContainer(
                      title: 'Benefits',
                      icon: Icons.workspace_premium,
                    ),
                    ClicableContainer(
                      title: 'Suggestions',
                      icon: Icons.lightbulb_outline_rounded,
                    ),
                    ClicableContainer(
                      title: 'Polls & surveys',
                      icon: Icons.sticky_note_2_sharp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
