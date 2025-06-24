import 'package:flutter/material.dart';

class IssueCategory {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  IssueCategory(this.title, this.icon, this.onTap);
}

class IssueCard extends StatelessWidget {
  final IssueCategory category;

  const IssueCard({required this.category});

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
            Icon(category.icon, size: 23, color: Colors.black87), // Smaller icon
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

