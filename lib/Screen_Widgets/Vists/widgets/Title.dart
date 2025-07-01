import 'package:flutter/material.dart';

import '../../../constant/Colors.dart';



class TilteContainer extends StatelessWidget {
  const TilteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        height: 60,
        width: 250,

        decoration: BoxDecoration(
          color: AppColors.Appbar,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text('Add New Visitor',  style: Theme.of(context).textTheme.headlineLarge,)),
      ),
    );
  }
}
