import 'package:flutter/material.dart';



class UplpoadPhoto extends StatelessWidget {
  const UplpoadPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(Icons.add),
    );
  }
}
