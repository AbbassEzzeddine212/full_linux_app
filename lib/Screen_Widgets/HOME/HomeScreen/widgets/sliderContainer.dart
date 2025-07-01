import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SLiderContainer_Controller.dart'; // adjust path

class Slidercontainer extends StatelessWidget {
  final int index;
  final SliderController controller;
  final int totalPages;

  const Slidercontainer({
    super.key,
    required this.index,
    required this.controller,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Color(0xFFd600d6), Color(0xFF110cc1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalPages, (dotIndex) {
                  bool isActive = controller.currentpage.value == dotIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 12 : 8,
                    height: isActive ? 12 : 8,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.white : Colors.white54,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}