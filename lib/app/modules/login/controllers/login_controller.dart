import 'package:dlp/app/modules/tabDecider/views/tab_decider_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = true;
  GetStorage box = GetStorage();
  late double progress;
  final loginFormKey = GlobalKey<FormState>();

  setObscure(bool status) {
    obscureText = status;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (box.read("user") != null) {
        Get.off(TabDeciderView());
      }
    });
    super.onInit();
  }
}
