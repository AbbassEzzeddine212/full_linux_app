import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Booking/widgets/Model.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:full_app/Screen_Widgets/MyBooking/MyBooking.dart'; // Import MyBooking
import 'package:get/get.dart';

class Newbooking extends StatelessWidget {
  final BookingItem item;

  const Newbooking({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Booking'),
      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Text(
                "Number     ${item.number}",
                style: const TextStyle(fontSize: 16),
              ),

              Text(
                "Location   ${item.location}",
                style: const TextStyle(fontSize: 16),
              ),

              const Text(
                "Availability",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      children: const [
                        Text("Date"),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Select date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Time"),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (var time in [
                                '10-11 AM',
                                '11-12 AM',
                                '12-1 PM',
                                '1-2 PM',
                                '2-3 PM',
                                '3-4 PM',
                              ])
                                Chip(
                                  label: Text(time),
                                  backgroundColor:
                                  (time == '1-2 PM' || time == '2-3 PM')
                                      ? Colors.grey[300]
                                      : Colors.white,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // ✅ Navigate to MyBooking screen with details
                    Get.to(() => Mybooking(
                      item: item,
                      status: "Approved",
                      dateAndTime: "2 July, 2-3 PM",
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Book",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
