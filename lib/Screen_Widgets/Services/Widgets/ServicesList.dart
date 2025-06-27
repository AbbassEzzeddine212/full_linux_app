import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Services/Widgets/ServicesController.dart';
import 'package:get/get.dart';

import '../../../constant/Colors.dart';




class ServicesLIst extends StatelessWidget {
   ServicesLIst({super.key});
   final ServicesController controller=Get.put(ServicesController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(()=>  Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.isOngoing.value = true,
                    child: Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: controller.isOngoing.value
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Ongoing",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.isOngoing.value = false,
                    child: Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !controller.isOngoing.value
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Obx(() {
              final Servic = controller.isOngoing.value
                  ? controller.ongoingIssues
                  : controller.completedIssues;
              return ListView.builder(
                itemCount: Servic.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final ServicesClass = Servic[index];
                  return Card(
                    elevation: 101,
                    color: AppColors.Appbar,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Icon(Icons.build),
                            Text(' ${ServicesClass['type']}',style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.black,
                        ),

                        Text('Status:   ${ServicesClass['status']}',style: TextStyle(fontSize: 20),),

                      ],
                    ),
                    // child: ListTile(
                    //   title: Text('${issue['id']} - ${issue['type']}'),
                    //   subtitle: Text('Status: ${issue['status']}'),
                    //
                    // ),
                  );
                },
              );
            }),
          ),
        ],
      ),),
    );
  }
}
