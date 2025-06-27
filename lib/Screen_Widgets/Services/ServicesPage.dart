import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Services/Widgets/ServicesList.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';
import '../../constant/Dimensions.dart';
import 'NewRequestPage.dart';
import 'Widgets/ServicesCatigories.dart';


class ServicesPage extends StatelessWidget {
   ServicesPage({super.key});
  final List<ServiceCategory> categories = [
    ServiceCategory(
      'HouseKeeping',
          () => Get.to(() => NewRquestInvoice(Title: 'HouseKeeping',)),
    ),
    ServiceCategory(
      'Cleaning',

          () => Get.to(() => NewRquestInvoice(Title: 'Cleaning',)),
    ),
    ServiceCategory(
      'Packing',

          () => Get.to(() => NewRquestInvoice(Title: 'Packing',)),
    ),ServiceCategory(
      'Carwash',

          () => Get.to(() => NewRquestInvoice(Title: 'Carwash',)),
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'service'),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Request a service',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: DimensionsApp.width*0.03,
                vertical: DimensionsApp.height*0.02,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.5,
                  // Slightly wider, flatter look
                  physics: NeverScrollableScrollPhysics(),
                  children: categories
                      .map((category) => ServicesCard(category: category))
                      .toList(),
                ),
              ),
            ),

            Expanded(child: ServicesLIst()),
          ],
        ),
      ),
    );
  }
}
