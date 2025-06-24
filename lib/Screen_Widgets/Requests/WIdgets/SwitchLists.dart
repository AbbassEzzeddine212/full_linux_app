import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Requests/WIdgets/SwitchLists_Controller.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:get/get.dart';

class Switchlists extends StatelessWidget {
  final IssuesController controller = Get.put(IssuesController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.isOngoing.value = true,
                    child: Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: controller.isOngoing.value
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
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
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
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

            Expanded(
              child: Obx(() {
                final issues = controller.isOngoing.value
                    ? controller.ongoingIssues
                    : controller.completedIssues;
                return ListView.builder(
                  itemCount: issues.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final issue = issues[index];
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
                              Text('${issue['id']} - ${issue['type']}'),
                            ],
                          ),
                          Divider(
                            indent: 20,
                            endIndent: 20,
                            color: Colors.black,
                          ),

                          Text('Status:   ${issue['status']}',),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.edit_note_rounded),
                              Icon(Icons.delete_outline),
                            ],
                          )
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
        ),
      ),
    );
  }
}
