import 'package:get/get.dart';


class ServicesController extends GetxController{
  var isOngoing = true.obs;

  final ongoingIssues = List.generate(
    2,
        (index) => {
      'type': 'CarWash',
      'status': index % 2 == 0 ? 'Pending' : 'Approved',
    },
  ).obs;

  final completedIssues = List.generate(
    5,
        (index) => {
      'type': 'Cleaning',
      'status': 'Completed',
    },
  ).obs;


}