import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Invoices/widgets/invoices_List.dart';
import 'package:full_app/constant/MyAppBar.dart';



class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Invoices/Due'),
      body: SafeArea(child: InvoicesList())
    );
  }
}
