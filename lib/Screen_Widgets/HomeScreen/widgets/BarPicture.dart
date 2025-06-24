import 'package:flutter/material.dart';



class Barpicture extends StatelessWidget {
  const Barpicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsGeometry.only(left: 12,bottom: 3),
        width: 15,
        height: 10,
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle
      ),
      );

  }
}
