import 'package:flutter/material.dart';



class Barpicture extends StatelessWidget {
  const Barpicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsGeometry.only(left: 12,bottom: 10,top: 1),
      width: 50, // You can adjust the size
      height: 50,
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
