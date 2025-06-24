import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NavigationController extends GetxController{

  var selectedindex=0.obs;

  void ChangePage(int index){
    selectedindex.value=index;
  }
}