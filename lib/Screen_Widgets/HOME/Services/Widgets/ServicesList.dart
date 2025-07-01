import 'package:flutter/material.dart';

import 'package:full_app/constant/Dimensions.dart';
import 'package:get/get.dart';

import '../../../../constant/Colors.dart';

import 'ServicesController.dart';




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
                        style: Theme.of(context).textTheme.bodyMedium
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
                          style: Theme.of(context).textTheme.bodyMedium
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
                    elevation: 7,
                    color: AppColors.Appbar,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    margin: EdgeInsets.only(bottom: 30),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: DimensionsApp.width*0.03,
                        vertical: DimensionsApp.height*0.03
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              Icon(Icons.build),
                              Text(' ${ServicesClass['type']}', style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          Divider(
                            indent: 20,
                            endIndent: 20,
                            color: Colors.black,
                          ),

                          Text('Status:   ${ServicesClass['status']}', style: Theme.of(context).textTheme.bodyMedium),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.edit_note_rounded),
                              Icon(Icons.delete_outline),
                            ],
                          ),
                        ],
                      ),
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
