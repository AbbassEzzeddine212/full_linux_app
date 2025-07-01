import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CHAT/ChatPage.dart';
import '../HOME/HomeScreen/Home.dart';
import '../PROFILE_SCREEN/PROFILE_Page.dart';

class NavigationController extends GetxController {
  var selectedindex = 0.obs;
  var currentPage = Rx<Widget>(Home()); // Default page is Home

  // Stack to hold page history
  final List<Widget> _pageStack = [Home()];

  void ChangePage(int index) {
    selectedindex.value = index;

    Widget page;

    switch (index) {
      case 0:
        page = Home();
        break;
      case 1:
        page = Center(child: Text("Tab 2"));
        break;
      case 2:
        page = ChatPage();
        break;
      case 3:
        page = ProfilePage();
        break;
      default:
        page = Home();
    }

    // Clear stack and add new page when switching bottom tabs
    _pageStack.clear();
    _pageStack.add(page);

    currentPage.value = page;
  }

  void openSubPage(Widget page) {
    _pageStack.add(page);
    currentPage.value = page;
  }

  bool goBack() {
    if (_pageStack.length > 1) {
      _pageStack.removeLast();
      currentPage.value = _pageStack.last;
      return true;
    }
    return false;
  }
}