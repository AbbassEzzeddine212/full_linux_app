import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:full_app/Screen_Widgets/Navigation_Pages/controller.dart';
import 'package:full_app/constant/Colors.dart';

class NavigationPages extends StatelessWidget {
  final NavigationController navcontroller = Get.find<NavigationController>();

  NavigationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
      onWillPop: () async {
        bool didPop = navcontroller.goBack();
        return !didPop; // if false, system can exit app
      },
      child: Scaffold(
        body: navcontroller.currentPage.value,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navcontroller.selectedindex.value,
          onTap: navcontroller.ChangePage,
          selectedItemColor: Colors.indigo,
          backgroundColor: AppColors.Appbar,
          showSelectedLabels: false, // 🔥 hide label
          showUnselectedLabels: false, // 🔥 hide label
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.touch_app_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
          ],
        ),
      ),
    ));
  }
}