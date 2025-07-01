import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';




class NewRequestController extends GetxController{
  var images = List<File?>.filled(3, null).obs;

  Future<void> pickImage(int index) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      images[index] = File(picked.path);
    }
  }
}