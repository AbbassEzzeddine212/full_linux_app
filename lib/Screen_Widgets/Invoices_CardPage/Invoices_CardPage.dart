import 'package:flutter/material.dart';
import 'package:full_app/constant/MyAppBar.dart';

class InvoicesCardpage extends StatelessWidget {
  const InvoicesCardpage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Invoices/dues'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 40,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Due Date: 20-7-2026',style: TextStyle(fontSize: 15),),
                Text('Title: payment for monthly services',style: TextStyle(fontSize: 15),),
                Text('Details:'),

              ],
            ),
            Divider(
              endIndent: 50,
              indent: 60,
              color: Colors.black,
            ),
            Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title                                       Amount',style: TextStyle(fontSize: 15),),
                Text('Rental                                       500 \$',style: TextStyle(fontSize: 15),),
                Text('Services                                        100 \$'),

                Text('Gym \nsubscription                             100 \$',style: TextStyle(fontSize: 15),),
                Text('General services                            50 \$'),

              ],
            ),
            Divider(
              endIndent: 50,
              indent: 60,
              color: Colors.black,
            ),
            Text('Total                                          750 \$',style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
    );
  }
}
