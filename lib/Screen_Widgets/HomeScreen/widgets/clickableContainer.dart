import 'package:flutter/material.dart';
import 'package:full_app/constant/Colors.dart';

class ClicableContainer extends StatelessWidget {
  const ClicableContainer({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 10,
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.Appbar,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1), // shadow color
                  spreadRadius: 4, // how wide the shadow spreads
                  blurRadius: 10, // how soft the shadow looks
                  offset: Offset(0, 4), // position: x (right), y (down)
                ),
              ],
            ),
            child: Icon(icon, size: 30),
          ),
          Text(title, maxLines: 2),
        ],
      ),
    );
  }
}
