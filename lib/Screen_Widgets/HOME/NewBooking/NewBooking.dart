import 'package:flutter/material.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:get/get.dart';

import 'package:full_app/constant/MyAppBar.dart';

import '../Booking/widgets/BookingController.dart';
import '../Booking/widgets/Model.dart';
import '../MyBooking/MyBooking.dart';


class Newbooking extends StatelessWidget {
  final BookingItem item;
  Newbooking({super.key, required this.item});

  final controller = Get.find<BookingController>();

  final times = [
    '10-11 AM',
    '11-12 AM',
    '12-1 PM',
    '1-2 PM',
    '2-3 PM',
    '3-4 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Booking'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: DimensionsApp.width * 0.02,
            vertical: DimensionsApp.height * 0.01,
          ),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text("Number     ${item.number}",
                  style: const TextStyle(fontSize: 16)),
              Text("Location   ${item.location}",
                  style: const TextStyle(fontSize: 16)),
              const Text("Availability",
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
                      children: [
                        const Text("Date"),
                        Expanded(
                          child: Obx(() => TextField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: controller.selectedDate.value,
                            ),
                            decoration: InputDecoration(
                              hintText: "Select date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                controller.selectedDate.value =
                                "${picked.day} ${_monthName(picked.month)}";
                              }
                            },
                          )),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Time"),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Obx(() => Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: times.map((time) {
                              final isSelected =
                                  controller.selectedTime.value == time;
                              return ChoiceChip(
                                label: Text(time),
                                selected: isSelected,
                                onSelected: (_) =>
                                controller.selectedTime.value = time,
                              );
                            }).toList(),
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.selectedDate.value.isEmpty ||
                        controller.selectedTime.value.isEmpty) {
                      Get.snackbar("Error", "Please select date and time");
                      return;
                    }

                    controller.bookItem(item);
                    controller.clearSelection();
                    Get.snackbar("Success", "Booking added!");

                    // ✅ Go directly to My Booking page after save
                    Get.off(() => Mybooking());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Book", style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month];
  }
}