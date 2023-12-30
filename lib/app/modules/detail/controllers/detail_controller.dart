import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController
  final box = GetStorage();
  final TextEditingController textController = TextEditingController();

  List photosBeforeRepair = [];
  List photosAfterRepair = [];

  @override
  void onInit() {
    super.onInit();
    photosBeforeRepair = box.read('photosBeforeRepair') ?? [];
    photosAfterRepair = box.read('photosAfterRepair') ?? [];
    loadMaterials();
    loadNotes();

    print("photosBeforeRepair : ${box.read('photosBeforeRepair')}");
    print("Materials : ${box.read('materials')}");

    materialCount = Map<String, int>.from(box.read('materialCount') ?? {});
    materialImages = Map<String, String>.from(box.read('materialImages') ?? {});

    print("Materials Count : ${materialCount}");
    print("Materials Image : ${materialImages}");

    print("photosAfterRepair : ${box.read('photosAfterRepair')}");
    print("Notes : ${box.read('notes')}");
  }

  void loadNotes() {
    String savedNotes = box.read('notes') ?? '';
    textController.text = savedNotes;
    update();
  }

  void saveNotes() {
    String notes = textController.text;
    box.write('notes', notes);
    update();
  }

  void clearNotes() {
    textController.text = '';
    saveNotes();
    update();
  }

  void loadMaterials() {
    materials = box.read('materials') ?? [];
    materialCount = Map<String, int>.from(box.read('materialCount') ?? {});
    materialImages = Map<String, String>.from(box.read('materialImages') ?? {});
  }

  void addPhoto(String listName, List photos, String photoPath) {
    photos.add(photoPath);
    box.write('$listName', photos);
    update();
  }

  void removePhoto(String listName, List photos, int index) {
    photos.removeAt(index);
    box.write('$listName', photos);
    update();
  }

  List materials = [];
  Map<String, int> materialCount = {};
  Map<String, String> materialImages = {};

  Future<void> addMaterial(String selectedMaterial, int count) async {
    if (selectedMaterial != null) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        String imagePath = pickedFile.path;
        materialImages[selectedMaterial] = imagePath;
        materialCount[selectedMaterial] ??= 0;
        materialCount[selectedMaterial] =
            (materialCount[selectedMaterial] ?? 0) + count;

        if (!materials.contains(selectedMaterial)) {
          materials.add(selectedMaterial);
        }

        saveMaterials();
      }
    }
  }

  void deleteMaterial(String material) {
    materials.remove(material);
    materialCount.remove(material);
    materialImages.remove(material);
    saveMaterials();
  }

  void saveMaterials() {
    box.write('materials', materials);
    box.write('materialCount', materialCount);
    box.write('materialImages', materialImages);

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
