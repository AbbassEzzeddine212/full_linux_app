import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Vists/widgets/TextFields.dart';
import 'package:full_app/Screen_Widgets/Vists/widgets/Title.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:full_app/constant/MyAppBar.dart';

class Vists extends StatelessWidget {
  const Vists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Vists'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
        child: Column(
          spacing: 30,
          children: [
            TilteContainer(),
            Textfields(Name: 'Name'),
            Textfields(Name: 'Car    '),
            Textfields(Name: 'Time '),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.Appbar,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Save'),
                ),
              ),
            ),

            Divider(indent: 30, endIndent: 30, color: Colors.black),

            Container(
              width: 400,
              decoration: BoxDecoration(
                color: AppColors.Appbar,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Visitor:'), Text('Hadi Ezzeddine')],
                    ),
                    Divider(indent: 30, endIndent: 30, color: Colors.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Status:'), Text('Pending')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Car:'), Text('Nissan Tiida')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Time:'), Text('June-6-2025 5:00pm')],
                    ),

                    Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 30,
                      children: [
                            Icon(Icons.delete_outline),
                            Icon(Icons.edit),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
