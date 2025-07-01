import 'package:flutter/material.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';

class InvoicesCardpage extends StatelessWidget {
  const InvoicesCardpage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final List<Map<String, String>> details = [
      {'title': 'Rental', 'amount': '500 \$'},
      {'title': 'Services', 'amount': '100 \$'},
      {'title': 'Gym subscription', 'amount': '100 \$'},
      {'title': 'General services', 'amount': '50 \$'},
    ];

    return Scaffold(
      appBar: MyAppBar(title: 'Invoices/dues'),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: DimensionsApp.width*0.03,
            vertical: DimensionsApp.height*0.03
          ),
          child: ListView(
            children: [
              Center(
                child: Text(
                  title,
                  style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),

              Divider(thickness: 1, height: 32),

              Text('Due Date: 20-7-2026', style: theme.bodyMedium),
              Text('Title: payment for monthly services', style: theme.bodyMedium),
              Text('Details:', style: theme.bodyMedium),

              Divider(thickness: 1, height: 32),

              _buildRow('Title', 'Amount', theme, isHeader: true),
              const Divider(),

              ...details.map((item) {
                return Column(
                  children: [
                    _buildRow(item['title']!, item['amount']!, theme),
                    const Divider(),
                  ],
                );
              }),

              Divider(thickness: 1.2),

              _buildRow('Total', '750 \$', theme, isHeader: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String left, String right, TextTheme theme, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              left,
              style: isHeader
                  ? theme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                  : theme.bodyMedium,
            ),
          ),
          Text(
            right,
            style: isHeader
                ? theme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                : theme.bodyMedium,
          ),
        ],
      ),
    );
  }
}