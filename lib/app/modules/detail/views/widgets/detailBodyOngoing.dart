import 'dart:io';

import 'package:dlp/app/modules/components/dialog.dart';
import 'package:dlp/app/modules/detail/controllers/detail_controller.dart';
import 'package:dlp/app/modules/detail/views/widgets/fullscreenPhotoView.dart';
import 'package:dlp/app/modules/detail/views/widgets/notesSheet.dart';
import 'package:dlp/app/modules/detail/views/widgets/showBottomSheet.dart';
import 'package:dlp/app/modules/detail/views/widgets/showImageInFullScreen.dart';
import 'package:dlp/app/modules/env/color.dart';
import 'package:dlp/app/modules/services/workorder.dart';
import 'package:dlp/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailBodyOngoing extends StatelessWidget {
  DetailBodyOngoing({super.key});

  DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          color: primaryColor,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Segment ${detailController.argumentData["tipe_segmen"]} - ${detailController.argumentData["lokasi_gangguan_masal"]}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFFCA4F63),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        detailController.formatDate(
                            detailController.argumentData["created_at"]),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFE3E5EB))),
                child: Theme(
                  data: ThemeData(
                    // Override the ExpansionTile Theme
                    dividerColor: Colors.transparent, // Remove default divider
                  ),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    leading: Icon(
                      Icons.info,
                      color: primaryColor,
                    ),
                    title: Text('Description'), // Judul saat diperkecil
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ticket Number",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                detailController.argumentData["nomor_tiket"],
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                detailController
                                    .argumentData["lokasi_gangguan_masal"],
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Segment Type",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Segmen ${detailController.argumentData["tipe_segmen"]}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.description,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 120,
                                child: Text(
                                  detailController
                                      .argumentData["deskripsi_gangguan"],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.info,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Instruction",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 120,
                                child: Text(
                                  detailController
                                      .argumentData["instruksi_pekerjaan"],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: detailController.argumentData["status"] ==
                                      "Waiting"
                                  ? Icon(
                                      Icons.access_time,
                                      color: primaryColor,
                                    )
                                  : detailController.argumentData["status"] ==
                                          "Ongoing"
                                      ? Icon(
                                          Icons.work_history_rounded,
                                          color: primaryColor,
                                        )
                                      : Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: primaryColor,
                                        )),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 120,
                                child: Text(
                                  detailController.argumentData["status"],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Icon(
                                Icons.person,
                                color: primaryColor,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Technician",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 120,
                                child: Text(
                                  detailController.argumentData["user"]["name"],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFE3E5EB))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Documentation Before Repair",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            // Mengambil foto dari galeri atau kamera menggunakan ImagePicker
                            final pickedFile = await ImagePicker().pickImage(
                              source: ImageSource
                                  .gallery, // Ganti dengan ImageSource.camera jika ingin menggunakan kamera
                            );

                            if (pickedFile != null) {
                              detailController.addPhoto(
                                  'photosBeforeRepair',
                                  detailController.photosBeforeRepair,
                                  pickedFile
                                      .path); // Menambahkan foto ke daftar foto
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<DetailController>(
                        init: DetailController(),
                        initState: (state) {},
                        builder: (c) {
                          return detailController.photosBeforeRepair.length != 0
                              ? SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 100,
                                  height: 70,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: detailController
                                          .photosBeforeRepair.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FullScreenPhotoView(
                                                  photoPath: detailController
                                                          .photosBeforeRepair[
                                                      index],
                                                  onDelete: () => confirmMessage(
                                                      context,
                                                      "Delete Confirmation",
                                                      "Are you sure want to delete this photo?",
                                                      () {
                                                    detailController.removePhoto(
                                                        'photosBeforeRepair',
                                                        detailController
                                                            .photosBeforeRepair,
                                                        index);
                                                    Get.back();
                                                    Get.back();
                                                  }),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            clipBehavior: Clip.hardEdge,
                                            height: 70,
                                            width: 70,
                                            child: Image.file(
                                              File(detailController
                                                  .photosBeforeRepair[index]),
                                              fit: BoxFit.cover,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xFFD9D9D9)),
                                          ),
                                        );
                                      }),
                                )
                              : InkWell(
                                  onTap: () async {
                                    // Mengambil foto dari galeri atau kamera menggunakan ImagePicker
                                    final pickedFile =
                                        await ImagePicker().pickImage(
                                      source: ImageSource
                                          .gallery, // Ganti dengan ImageSource.camera jika ingin menggunakan kamera
                                    );

                                    if (pickedFile != null) {
                                      detailController.addPhoto(
                                          'photosBeforeRepair',
                                          detailController.photosBeforeRepair,
                                          pickedFile
                                              .path); // Menambahkan foto ke daftar foto
                                    }
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFD9D9D9)),
                                  ),
                                );
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<DetailController>(
                  init: DetailController(),
                  initState: (state) {},
                  builder: (c) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE3E5EB))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "List Used Material",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  showAddMaterialBottomSheet(
                                      context, detailController.addMaterial);
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          detailController.materials.length != 0
                              ? SizedBox(
                                  height: 100,
                                  width: MediaQuery.sizeOf(context).width - 50,
                                  child: ListView.builder(
                                    itemCount:
                                        detailController.materials.length,
                                    itemBuilder: (context, index) {
                                      String material =
                                          detailController.materials[index];
                                      int materialUsed = detailController
                                              .materialCount[material] ??
                                          0;
                                      String imagePath = detailController
                                              .materialImages[material] ??
                                          '';

                                      return Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            clipBehavior: Clip.hardEdge,
                                            height: 50,
                                            width: 50,
                                            child: imagePath.isNotEmpty
                                                ? InkWell(
                                                    onTap: () {
                                                      showImageInFullScreen(
                                                          context, imagePath);
                                                    },
                                                    child: Image.file(
                                                      File(imagePath),
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Icon(
                                                    Icons.add_a_photo,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xFFD9D9D9)),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('$material x $materialUsed'),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () => detailController
                                                .deleteMaterial(material),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )
                              : SizedBox.shrink()
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFE3E5EB))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Documentation After Repair",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            // Mengambil foto dari galeri atau kamera menggunakan ImagePicker
                            final pickedFile = await ImagePicker().pickImage(
                              source: ImageSource
                                  .gallery, // Ganti dengan ImageSource.camera jika ingin menggunakan kamera
                            );

                            if (pickedFile != null) {
                              detailController.addPhoto(
                                  'photosAfterRepair',
                                  detailController.photosAfterRepair,
                                  pickedFile.path); // n foto ke daftar foto
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<DetailController>(
                        init: DetailController(),
                        initState: (state) {},
                        builder: (c) {
                          return detailController.photosAfterRepair.length != 0
                              ? SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 100,
                                  height: 70,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: detailController
                                          .photosAfterRepair.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FullScreenPhotoView(
                                                  photoPath: detailController
                                                      .photosAfterRepair[index],
                                                  onDelete: () => confirmMessage(
                                                      context,
                                                      "Delete Confirmation",
                                                      "Are you sure want to delete this photo?",
                                                      () {
                                                    detailController.removePhoto(
                                                        "photosAfterRepair",
                                                        detailController
                                                            .photosAfterRepair,
                                                        index);
                                                    Get.back();
                                                    Get.back();
                                                  }),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            clipBehavior: Clip.hardEdge,
                                            height: 70,
                                            width: 70,
                                            child: Image.file(
                                              File(detailController
                                                  .photosAfterRepair[index]),
                                              fit: BoxFit.cover,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xFFD9D9D9)),
                                          ),
                                        );
                                      }),
                                )
                              : InkWell(
                                  onTap: () async {
                                    // Mengambil foto dari galeri atau kamera menggunakan ImagePicker
                                    final pickedFile =
                                        await ImagePicker().pickImage(
                                      source: ImageSource
                                          .gallery, // Ganti dengan ImageSource.camera jika ingin menggunakan kamera
                                    );

                                    if (pickedFile != null) {
                                      detailController.addPhoto(
                                          "photosAfterRepair",
                                          detailController.photosAfterRepair,
                                          pickedFile
                                              .path); // Menambahkan foto ke daftar foto
                                    }
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFD9D9D9)),
                                  ),
                                );
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<DetailController>(
                  init: DetailController(),
                  initState: (state) {},
                  builder: (c) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE3E5EB))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Notes",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  CustomBottomSheet.show(
                                      context,
                                      detailController.textController,
                                      detailController.saveNotes);
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          detailController.textController.text != ''
                              ? Column(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(detailController.textController.text),
                                ])
                              : SizedBox.shrink()
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 30,
              ),
              PrimaryButton(
                  text: 'Submit Workorder',
                  onTap: () {
                    confirmMessage(context, "Kirim Data",
                        "Apakah Anda siap untuk mengirim data yang telah diisi?",
                        () {
                      WorkorderService().submitWorkorder(
                          context, detailController.argumentData["id"]);
                      Get.back();
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
