import 'package:flutter/material.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:get/get.dart';

import 'SwitchLists_Controller.dart';

class Switchlists extends StatelessWidget {
  final IssuesController controller = Get.put(IssuesController());

  Switchlists({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Obx(
        () => Column(
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
                          style: Theme.of(context).textTheme.bodySmall,
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Obx(() {
                final issues = controller.isOngoing.value
                    ? controller.ongoingIssues
                    : controller.completedIssues;
                return ListView.builder(
                  itemCount: issues.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: DimensionsApp.width * 0.02,
                    vertical: DimensionsApp.height * 0.03,
                  ),
                  itemBuilder: (context, index) {
                    final issue = issues[index];
                    return Card(
                      elevation: 5,
                      color: AppColors.Appbar,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      margin: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: DimensionsApp.width * 0.05,
                          vertical: DimensionsApp.height * 0.02,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.build),
                                Text('${issue['id']} - ${issue['type']}'),
                              ],
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              color: Colors.black,
                            ),

                            Text('Status:   ${issue['status']}'),
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
        ),
      ),
    );
  }
}
