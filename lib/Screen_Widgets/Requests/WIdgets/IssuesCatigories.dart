import 'package:flutter/material.dart';

class IssueCategory {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  IssueCategory(this.title, this.icon, this.onTap);
}

class IssueCard extends StatelessWidget {
  final IssueCategory category;

  const IssueCard({super.key, required this.category});

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
              spreadRadius: 0, // how wide the shadow spreads
              blurRadius: 7, // how soft the shadow looks

            ),
          ],
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category.icon, color: Colors.black87), // Smaller icon

            Text(
              category.title,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.bodyMedium// From 8 → 10
            ),
          ],
        ),
      ),
    );
  }
}

