import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController
  final box = GetStorage();
  final TextEditingController textController = TextEditingController();
  var argumentData = Get.arguments;

  List photosBeforeRepair = [];
  List photosAfterRepair = [];

  @override
  void onInit() {
    super.onInit();
    retrieveDetailInformation();
  }

  void saveDetailInformation(String detailId) {
    var detailInformation = {
      'photosBeforeRepair': photosBeforeRepair,
      'materials': materials,
      "materialCount": materialCount,
      "materialImages": materialImages,
      "materialId": materialId,
      "photosAfterRepair": photosAfterRepair,
      "notes": textController.text,
    };

    box.write(detailId, detailInformation);
  }

  setWorkordersData(data) {
    argumentData = data;
    update();
  }

  var listMaterials = [].obs;
  // Fungsi untuk mengambil data dari server
  void setlistMaterialData(data) async {
    listMaterials.assignAll(data);
    update();
  }

  getDetailInformation(String detailId) {
    // Mengambil informasi detail berdasarkan ID dari GetStorage
    return box.read(detailId);
  }

  // Contoh pemanggilan untuk mendapatkan informasi detail dengan ID tertentu
  void retrieveDetailInformation() {
    String detailId = argumentData["id"].toString();
    var detailInformation = getDetailInformation(detailId);

    print('Informasi Detail: $detailInformation');
    if (detailInformation != null) {
      photosBeforeRepair = detailInformation['photosBeforeRepair'] ?? [];
      photosAfterRepair = detailInformation['photosAfterRepair'] ?? [];
      materials = detailInformation['materials'] ?? [];
      materialCount =
          Map<String, int>.from(detailInformation['materialCount'] ?? {});
      materialImages =
          Map<String, String>.from(detailInformation['materialImages'] ?? {});
      materialId = Map<String, int>.from(detailInformation['materialId'] ?? {});
      textController.text = detailInformation['notes'] ?? '';
    } else {
      print('Detail dengan ID $detailId tidak ditemukan.');
    }
  }

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    return formattedDate;
  }

  void saveNotes() {
    String notes = textController.text;
    saveDetailInformation(argumentData["id"].toString());
    update();
  }

  void clearNotes() {
    textController.text = '';
    saveNotes();
    update();
  }

  void addPhoto(String listName, List photos, String photoPath) {
    photos.add(photoPath);
    saveDetailInformation(argumentData["id"].toString());
    update();
  }

  void removePhoto(String listName, List photos, int index) {
    photos.removeAt(index);
    saveDetailInformation(argumentData["id"].toString());
    update();
  }

  List materials = [];
  Map<String, int> materialId = {};
  Map<String, int> materialCount = {};
  Map<String, String> materialImages = {};

  Future<void> addMaterial(selectedMaterial, int count) async {
    if (selectedMaterial != null) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      String materialName = selectedMaterial["nama"];
      if (pickedFile != null) {
        String imagePath = pickedFile.path;
        materialId[materialName] = selectedMaterial["id"];
        materialImages[materialName] = imagePath;
        materialCount[materialName] ??= 0;
        materialCount[materialName] =
            (materialCount[materialName] ?? 0) + count;

        if (!materials.contains(materialName)) {
          materials.add(materialName);
        }

        saveMaterials();
      }
    }
  }

  void deleteMaterial(String material) {
    materials.remove(material);
    materialCount.remove(material);
    materialId.remove(material);
    materialImages.remove(material);
    saveMaterials();
  }

  void saveMaterials() {
    saveDetailInformation(argumentData["id"].toString());
    update();
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
