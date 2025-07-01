import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ServicesController extends GetxController{
  var isOngoing = true.obs;
  var images = List<File?>.filled(1, null).obs;

  final ongoingIssues = List.generate(
    2,
        (index) => {
      'type': 'CarWash',
      'status': index % 2 == 0 ? 'Pending' : 'Approved',
    },
  ).obs;

  final completedIssues = List.generate(
    5,
        (index) => {
      'type': 'Cleaning',
      'status': 'Completed',
    },
  ).obs;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      images[0] = File(picked.path);
    }
  }



}