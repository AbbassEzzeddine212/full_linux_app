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
                  spreadRadius: 2, // how wide the shadow spreads
                  blurRadius: 11, // how soft the shadow looks
                ),
              ],
            ),
            child: Icon(icon),
          ),
          Text(title, maxLines: 2,style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
