import 'package:get/get.dart';

class InvoicesList_Controller extends GetxController {
  var changed = true.obs;

  final due = List.generate(
    5,
    (index) => {
      'id': 'invoice no $index',
      'status': 'due $index days ago',
      'Amount': '${index * 100}\$',
    },
  ).obs;

  final Archived = List.generate(
    3,
    (index) => {
      'id': 'invoice no $index',
      'status': 'Archived',
      'Amount': '${index * 100}\$',
    },
  ).obs;
}
