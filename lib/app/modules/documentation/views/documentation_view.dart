import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/documentation_controller.dart';

class DocumentationView extends GetView<DocumentationController> {
  const DocumentationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocumentationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DocumentationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
