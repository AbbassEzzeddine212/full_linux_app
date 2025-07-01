import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Services/Widgets/ServicesList.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';
import '../../constant/Dimensions.dart';
import '../Navigation_Pages/controller.dart'; // ✅ Import for back navigation
import 'NewRequestPage.dart';
import 'Widgets/ServicesCatigories.dart';

class ServicesPage extends StatelessWidget {
  ServicesPage({super.key});

  final List<ServiceCategory> categories = [
    ServiceCategory(
      'HouseKeeping',
          () => Get.to(() => NewRquestInvoice(Title: 'HouseKeeping')),
    ),
    ServiceCategory(
      'Cleaning',
          () => Get.to(() => NewRquestInvoice(Title: 'Cleaning')),
    ),
    ServiceCategory(
      'Packing',
          () => Get.to(() => NewRquestInvoice(Title: 'Packing')),
    ),
    ServiceCategory(
      'Carwash',
          () => Get.to(() => NewRquestInvoice(Title: 'Carwash')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>(); // ✅ Back control

    return Scaffold(
      appBar: MyAppBar(
        title: 'Service',
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navController.goBack(), // ✅ Use controller
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Request a service',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DimensionsApp.width * 0.03,
                vertical: DimensionsApp.height * 0.02,
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
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.7,
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
