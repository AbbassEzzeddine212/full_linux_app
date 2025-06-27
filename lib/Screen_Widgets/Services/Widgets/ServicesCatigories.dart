import 'package:flutter/material.dart';

class ServiceCategory {
  final String title;
  final void Function()? onTap;

  ServiceCategory(this.title, this.onTap);
}

class ServicesCard extends StatelessWidget {
  final ServiceCategory category;

  const ServicesCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => category.onTap?.call(),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(

          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1), // shadow color
              spreadRadius: 4, // how wide the shadow spreads
              blurRadius: 10, // how soft the shadow looks
              offset: Offset(0, 4), // position: x (right), y (down)
            ),
          ],
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            Text(
              category.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500), // From 8 → 10
            ),
          ],
        ),
      ),
    );
  }
}

