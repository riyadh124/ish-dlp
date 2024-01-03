import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  List<String> texts = ['Waiting', 'Ongoing', 'Done'];
  int selectedIndex = 0;
  var box = GetStorage();

  var selectedStatus = "Waiting";

  List workorders = [];

  setWorkordersData(List data) {
    workorders = data;
    update();
  }

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    return formattedDate;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
