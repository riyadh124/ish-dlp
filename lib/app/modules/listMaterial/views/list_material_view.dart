import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_material_controller.dart';

class ListMaterialView extends GetView<ListMaterialController> {
  const ListMaterialView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListMaterialView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListMaterialView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
