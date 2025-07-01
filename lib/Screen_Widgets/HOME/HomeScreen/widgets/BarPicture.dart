import 'package:flutter/material.dart';

class Barpicture extends StatelessWidget {
  const Barpicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.only(left: 15, bottom: 15, top: 5),
      width: 40, // You can adjust the size
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/profilr.avif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
