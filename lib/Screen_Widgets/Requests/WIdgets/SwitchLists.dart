import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Requests/WIdgets/SwitchLists_Controller.dart';
import 'package:full_app/constant/Colors.dart';
import 'package:get/get.dart';

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
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
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
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                          )
                  )
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

                          Text('Status:   ${issue['status']}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.edit_note_rounded),
                              Icon(Icons.delete_outline),
                            ],
                          ),
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
