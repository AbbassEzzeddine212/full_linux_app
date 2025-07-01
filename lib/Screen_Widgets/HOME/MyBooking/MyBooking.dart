import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Booking/widgets/BookingController.dart';

class Mybooking extends StatelessWidget {
  final controller = Get.find<BookingController>();

   Mybooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Booking')),
      body: Obx(() {
        if (controller.bookedItems.isEmpty) {
          return const Center(child: Text("No bookings yet."));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.bookedItems.length,
          itemBuilder: (context, index) {
            final booked = controller.bookedItems[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      booked.imagePath,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Number: ${booked.number}"),
                        Text("Location: ${booked.location}"),
                        Text("Status: ${booked.status ?? 'N/A'}"),
                        Text("Date And Time: ${booked.dateAndTime ?? 'N/A'}"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
