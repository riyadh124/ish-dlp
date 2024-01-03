import 'dart:io';

import 'package:dlp/app/modules/components/dialog.dart';
import 'package:dlp/app/modules/detail/views/widgets/detailBodyDone.dart';
import 'package:dlp/app/modules/detail/views/widgets/detailBodyOngoing.dart';
import 'package:dlp/app/modules/detail/views/widgets/detailBodyWaiting.dart';
import 'package:dlp/app/modules/documentation/views/documentation_view.dart';
import 'package:dlp/app/modules/env/color.dart';
import 'package:dlp/app/modules/env/global_var.dart';
import 'package:dlp/app/modules/listMaterial/views/list_material_view.dart';
import 'package:dlp/app/modules/services/workorder.dart';
import 'package:dlp/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  DetailController detailController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: GetBuilder<DetailController>(
            init: DetailController(),
            initState: (state) {},
            builder: (c) {
              return SingleChildScrollView(
                  child: detailController.argumentData["status"] == 'Waiting'
                      ? DetailBodyWaiting()
                      : detailController.argumentData["status"] == 'Ongoing'
                          ? DetailBodyOngoing()
                          : DetailBodyDone());
            }));
  }
}
