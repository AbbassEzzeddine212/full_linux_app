import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'Controller.dart';



class UploadPhoto extends StatelessWidget {
  final int index;
  const UploadPhoto({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewRequestController>();

    return GestureDetector(
      onTap: () => controller.pickImage(index),
      child: Obx(() {
        File? image = controller.images[index];
        return Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            image: image != null
                ? DecorationImage(image: FileImage(image), fit: BoxFit.cover)
                : null,
          ),
          child: image == null
              ? const Icon(Icons.add, color: Colors.black54)
              : null,
        );
      }),
    );
  }
}