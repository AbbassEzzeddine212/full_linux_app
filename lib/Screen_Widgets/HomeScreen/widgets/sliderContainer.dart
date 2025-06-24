import 'dart:ui';

import 'package:flutter/material.dart';

class Slidercontainer extends StatelessWidget {
  const Slidercontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10),
      child: Container(
        width: 360,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black,
          gradient: LinearGradient(
            colors: [Color(0xFFd600d6), Color(0Xff110cc1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 20, left: 120,
                child: Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey,

                  ),
                )),
          ],
        ),
      ),
    );
  }
}
