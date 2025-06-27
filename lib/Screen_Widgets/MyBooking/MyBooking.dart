import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Booking/widgets/Model.dart';
import 'package:full_app/constant/MyAppBar.dart';

class Mybooking extends StatelessWidget {
  final BookingItem item;
  final String status;
  final String dateAndTime;

  const Mybooking({
    super.key,
    required this.item,
    required this.status,
    required this.dateAndTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'My Booking'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(item.imagePath, height: 180, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Number      ${item.number}"),
                      const SizedBox(height: 4),
                      Text("Location    ${item.location}"),
                      const SizedBox(height: 4),
                      Text("Status      $status"),
                      const SizedBox(height: 4),
                      Text("Date And Time: $dateAndTime"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
