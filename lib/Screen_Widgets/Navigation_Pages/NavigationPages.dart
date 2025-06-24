import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/HomeScreen/Home.dart';
import 'package:full_app/Screen_Widgets/Navigation_Pages/controller.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:get/get.dart';

class NavigationPages extends StatelessWidget {
  final NavigationController navcontroller = Get.put(NavigationController());

  final List<Widget> pages = [
    Home(),
    SafeArea(child: Center(child: Text("🔄 2"))),
    SafeArea(child: Center(child: Text("👥 2"))),
    SafeArea(child: Center(child: Text("👥 Profile"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[navcontroller.selectedindex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navcontroller.selectedindex.value,
          onTap: navcontroller.ChangePage,
          selectedItemColor: Colors.indigo,

          backgroundColor: AppColors.Appbar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.laptop, size: 30),
              label: "2",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 30),
              label: "3",
            ),
            BottomNavigationBarItem(

              icon: Icon(Icons.person, size: 30),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
