import 'package:get/get.dart';

import '../controllers/list_material_controller.dart';

class ListMaterialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMaterialController>(
      () => ListMaterialController(),
    );
  }
}
