import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Invoices/widgets/InvoicesList_Controller.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:get/get.dart';

import '../../../constant/Colors.dart';
import '../../Invoices_CardPage/Invoices_CardPage.dart';

class InvoicesList extends StatelessWidget {
  InvoicesList({super.key});

  final InvoicesList_Controller controller = Get.put(InvoicesList_Controller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: DimensionsApp.width*0.04,
        vertical: DimensionsApp.height*0.05
      ),
      child: Obx(
        () => Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changed.value = true,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: controller.changed.value
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Due",
                         style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changed.value = false,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: !controller.changed.value
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Archived",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                final invoices = controller.changed.value
                    ? controller.due
                    : controller.Archived;
                return ListView.builder(
                  itemCount: invoices.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: DimensionsApp.width*0.02,
                    vertical: DimensionsApp.height*0.03
                  ),
                  itemBuilder: (context, index) {
                    final invoice = invoices[index];
                    return InkWell(
                      onTap: () =>Get.to(InvoicesCardpage(title: '${invoice['id']}',)),
                      child: Card(
                        elevation: 7,
                        color: AppColors.Appbar,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),

                        margin: EdgeInsets.only(bottom: 30),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: DimensionsApp.width*0.03,
                            vertical: DimensionsApp.height*0.02
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${invoice['id']}',  style: Theme.of(context).textTheme.bodyMedium,),

                              Divider(
                                indent: 00,
                                endIndent: 100,
                                color: Colors.black,
                              ),

                              Text('Status:   ${invoice['status']}',  style: Theme.of(context).textTheme.bodyMedium,),
                              Text('Amount:  ${invoice['Amount']}',  style: Theme.of(context).textTheme.bodyMedium,),
                            ],
                          ),
                        ),
                        // child: ListTile(
                        //   title: Text('${issue['id']} - ${issue['type']}'),
                        //   subtitle: Text('Status: ${issue['status']}'),
                        //
                        // ),
                      ),
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
