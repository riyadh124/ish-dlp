// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:dlp/app/modules/components/dialog.dart';
import 'package:dlp/app/modules/components/loading.dart';
import 'package:dlp/app/modules/detail/controllers/detail_controller.dart';
import 'package:dlp/app/modules/env/global_var.dart';
import 'package:dlp/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WorkorderService extends GetConnect {
  GetStorage box = GetStorage();

  void getWorkorders(status) async {
    List workorders = [];

    HomeController homeController = Get.put(HomeController());

    try {
      final response = await get('$urlApi/api/workorder?status=$status',
          headers: {'Authorization': "Bearer ${box.read('token')}"});
      var data = response.body;

      print("data activity : $data");

      if (data != null) {
        data.forEach((v) => workorders.add(v));
        homeController.setWorkordersData(workorders);
      }
    } catch (e) {
      errorMessage(e);
    }
  }

  void getListMaterial() async {
    List listMaterial = [];

    DetailController detailController = Get.put(DetailController());

    try {
      final response = await get('$urlApi/api/material',
          headers: {'Authorization': "Bearer ${box.read('token')}"});
      var data = response.body;

      print("Data Material : $data");

      if (data != null) {
        data.forEach((v) => listMaterial.add(v));
        detailController.setlistMaterialData(listMaterial);
      }

      print("data : $data");
    } catch (e) {
      errorMessage(e);
    }
  }

  void UpdateWorkorder(context, id, status) async {
    var workorders;

    DetailController detailController = Get.put(DetailController());

    try {
      onLoading(context);

      final response = await put(
          '$urlApi/api/workorder/$id/update-status', {"status": status},
          headers: {'Authorization': "Bearer ${box.read('token')}"});

      var data = response.body;
      workorders = data["workorder"];

      print("data activity : $data");

      if (data != null) {
        onLoadingDismiss(context);
        successMessage(context, data["message"]);
        getWorkorders("Waiting");
        detailController.setWorkordersData(workorders);
      }
    } catch (e) {
      onLoadingDismiss(context);
      errorMessage(e);
    }
  }

  Future submitWorkorder(context, id) async {
    DetailController detailController = Get.put(DetailController());

    try {
      onLoading(context);

      var fotoSebelumPekerjaanFutures =
          detailController.photosBeforeRepair.map((item) {
        return Future.value(uploadImage(File(item)));
      });

      var fotoSetelahPekerjaanFutures =
          detailController.photosAfterRepair.map((item) {
        return Future.value(uploadImage(File(item)));
      });

      // Menunggu semua futures selesai
      var fotoSebelumPekerjaanResults =
          await Future.wait(fotoSebelumPekerjaanFutures);
      var fotoSetelahPekerjaanResults =
          await Future.wait(fotoSetelahPekerjaanFutures);

      print("fotoSebelumPekerjaan : $fotoSebelumPekerjaanResults");
      print("fotoSetelahPekerjaan : $fotoSetelahPekerjaanResults");
      List<Map<String, dynamic>> listMaterial = [];

      await Future.forEach(detailController.materials, (material) async {
        var id = detailController.materialId[material];
        var count = detailController.materialCount[material];
        var image = detailController.materialImages[material]!;

        // Memastikan bahwa uploadImage mengembalikan Future
        var uploadedImage =
            await uploadImage(File(image)); // Menunggu hasil uploadImage

        var materialData = {
          'id': id,
          'count': count,
          'image': uploadedImage, // Menggunakan hasil uploadImage
        };

        listMaterial.add(materialData);
      });

      final response = await put('$urlApi/api/workorder/$id/input-data', {
        "foto_sebelum_pekerjaan": fotoSebelumPekerjaanResults,
        "list_material": listMaterial,
        "foto_setelah_pekerjaan": fotoSetelahPekerjaanResults,
        "keterangan_perbaikan": detailController.textController.text
      }, headers: {
        'Authorization': "Bearer ${box.read('token')}"
      });

      var data = response.body;

      if (data != null) {
        onLoadingDismiss(context);
        successMessage(context, data["message"]);
        getWorkorders("Waiting");
        detailController.setWorkordersData(data["workorder"]);
      }
    } catch (e) {
      onLoadingDismiss(context);
      errorMessage(e);
    }
  }

  uploadImage(image) async {
    try {
      final form = FormData({
        'image': MultipartFile(image.path.toString(),
            filename: 'file${image.path.split('/').last}'),
      });
      final response = await post('$urlApi/api/upload-image', form,
          headers: {'Authorization': 'Bearer ' + box.read('token')});
      var data = response.body;
      print(data);

      return data["image_path"];
    } catch (e) {
      errorMessage(e);
    }
  }
}
