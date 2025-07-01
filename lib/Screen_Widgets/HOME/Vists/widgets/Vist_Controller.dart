import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'Model.darl.dart';

class VisitsController extends GetxController {
  var showForm = false.obs;

  final nameController = TextEditingController();
  final carController = TextEditingController();
  final timeController = TextEditingController();

  var visitors = <Visitor>[].obs;

  void addVisitor() {
    if (nameController.text.isNotEmpty &&
        carController.text.isNotEmpty &&
        timeController.text.isNotEmpty) {
      visitors.add(Visitor(
        name: nameController.text,
        car: carController.text,
        time: timeController.text,
      ));
      // Clear form
      nameController.clear();
      carController.clear();
      timeController.clear();
      showForm.value = false;
    }
  }

  void deleteVisitor(int index) {
    visitors.removeAt(index);
  }
}