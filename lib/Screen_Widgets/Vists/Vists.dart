import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Vists/widgets/Vist_Controller.dart';
import 'package:get/get.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';
import '../Navigation_Pages/controller.dart'; // ✅ Add this

class Vists extends StatelessWidget {
  final controller = Get.put(VisitsController());
  final NavigationController navController = Get.find<NavigationController>(); // ✅ Add this

  Vists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Visits',
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navController.goBack(), // ✅ Use navController to go back
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DimensionsApp.width * 0.05,
              vertical: DimensionsApp.height * 0.01,
            ),
            child: Column(
              children: [
                // Toggle button
                Center(
                  child: GestureDetector(
                    onTap: () => controller.showForm.toggle(),
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: AppColors.Appbar,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text('Add New Visitor',
                            style: Theme.of(context).textTheme.headlineLarge),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Form section
                Obx(() {
                  if (!controller.showForm.value) return SizedBox.shrink();
                  return Column(
                    children: [
                      _buildTextField(context, 'Name', controller.nameController),
                      _buildTextField(context, 'Car', controller.carController),
                      _buildTimeField(context, controller.timeController),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            onPressed: controller.addVisitor,
                            child: Text('Save'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(indent: 30, endIndent: 30),
                    ],
                  );
                }),

                // Visitor list
                Obx(() => Column(
                  children: controller.visitors.asMap().entries.map((entry) {
                    final index = entry.key;
                    final visitor = entry.value;
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.Appbar,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Visitor:'),
                              Text(visitor.name),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Status:'),
                              Text('Pending'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Car:'),
                              Text(visitor.car),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Time:'),
                              Text(visitor.time),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () => controller.deleteVisitor(index),
                              ),
                              Icon(Icons.edit),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      BuildContext context, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('$label: ', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeField(
      BuildContext context, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('Time: ', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              readOnly: true,
              onTap: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  controller.text = pickedTime.format(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
