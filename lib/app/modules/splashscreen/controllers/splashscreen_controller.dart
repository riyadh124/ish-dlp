import 'package:dlp/app/modules/login/views/login_view.dart';
import 'package:dlp/app/modules/tabDecider/views/tab_decider_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  var box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      if (box.read('token') != null) {
        Get.off(TabDeciderView());
      } else {
        Get.off(LoginView());
      }
    });
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
