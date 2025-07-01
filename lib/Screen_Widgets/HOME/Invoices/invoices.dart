import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/HOME/Invoices/widgets/invoices_List.dart';

import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';

import '../../Navigation_Pages/controller.dart';


class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>(); // ✅ For back

    return Scaffold(
      appBar: MyAppBar(
        title: 'Invoices/Due',
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navController.goBack(), // ✅ Go back properly
        ),
      ),
      body: SafeArea(
        child: InvoicesList(),
      ),
    );
  }
}
