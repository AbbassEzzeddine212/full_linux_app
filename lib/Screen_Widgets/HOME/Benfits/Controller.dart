

import 'package:get/get.dart';

class BenefitsController extends GetxController {
  var selectedTab = 'Deals'.obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }
}