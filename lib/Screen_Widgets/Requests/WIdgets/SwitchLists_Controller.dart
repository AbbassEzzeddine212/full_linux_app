import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IssuesController extends GetxController{
  var isOngoing = true.obs;

  final ongoingIssues = List.generate(
    20,
        (index) => {
      'id': '00123$index',
      'type': 'Issue $index',
      'status': index % 2 == 0 ? 'Pending' : 'Approved',
    },
  ).obs;

  final completedIssues = List.generate(
    10,
        (index) => {
      'id': '00200$index',
      'type': 'Completed Issue $index',
      'status': 'Completed',
    },
  ).obs;


}