import 'dart:io';

import 'package:dlp/app/modules/components/dialog.dart';
import 'package:dlp/app/modules/detail/controllers/detail_controller.dart';
import 'package:dlp/app/modules/detail/views/widgets/fullscreenPhotoView.dart';
import 'package:dlp/app/modules/detail/views/widgets/notesSheet.dart';
import 'package:dlp/app/modules/detail/views/widgets/showBottomSheet.dart';
import 'package:dlp/app/modules/detail/views/widgets/showImageInFullScreen.dart';
import 'package:dlp/app/modules/env/color.dart';
import 'package:dlp/app/modules/env/global_var.dart';
import 'package:dlp/app/modules/services/workorder.dart';
import 'package:dlp/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailBodyDone extends StatelessWidget {
  DetailBodyDone({super.key});

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
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<DetailController>(
                        init: DetailController(),
                        initState: (state) {},
                        builder: (c) {
                          return detailController
                                      .argumentData["documentation_before"]
                                      .length !=
                                  0
                              ? SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 100,
                                  height: 70,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: detailController
                                          .argumentData["documentation_before"]
                                          .length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            showImageInFullScreen(
                                                context,
                                                detailController.argumentData[
                                                        "documentation_before"]
                                                    [index]["image"]);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            clipBehavior: Clip.hardEdge,
                                            height: 70,
                                            width: 70,
                                            child: Image.network(
                                              "${urlApi}/storage/${detailController.argumentData["documentation_before"][index]["image"]}",
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
                              : Container(
                                  height: 70,
                                  width: 70,
                                  child: Icon(
                                    Icons.image_not_supported_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFD9D9D9)),
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
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          detailController
                                      .argumentData["list_materials"].length !=
                                  0
                              ? SizedBox(
                                  height: 100,
                                  width: MediaQuery.sizeOf(context).width - 50,
                                  child: ListView.builder(
                                    itemCount: detailController
                                        .argumentData["list_materials"].length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            clipBehavior: Clip.hardEdge,
                                            height: 50,
                                            width: 50,
                                            child: detailController
                                                    .argumentData[
                                                        "list_materials"][index]
                                                        ["image"]
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () {
                                                      showImageInFullScreen(
                                                          context,
                                                          detailController
                                                                      .argumentData[
                                                                  "list_materials"]
                                                              [index]["image"]);
                                                    },
                                                    child: Image.network(
                                                      "${urlApi}/storage/${detailController.argumentData["list_materials"][index]["image"]}",
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Icon(
                                                    Icons.image_not_supported,
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
                                          Text(
                                              '${detailController.argumentData["list_materials"][index]["material"]["nama"]} x ${detailController.argumentData["list_materials"][index]["count"]}'),
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
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<DetailController>(
                        init: DetailController(),
                        initState: (state) {},
                        builder: (c) {
                          return detailController
                                      .argumentData["documentation_after"]
                                      .length !=
                                  0
                              ? SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 100,
                                  height: 70,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: detailController
                                          .argumentData["documentation_after"]
                                          .length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            showImageInFullScreen(
                                                context,
                                                detailController.argumentData[
                                                        "documentation_after"]
                                                    [index]["image"]);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            clipBehavior: Clip.hardEdge,
                                            height: 70,
                                            width: 70,
                                            child: Image.network(
                                              "${urlApi}/storage/${detailController.argumentData["documentation_after"][index]["image"]}",
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
                              : Container(
                                  height: 70,
                                  width: 70,
                                  child: Icon(
                                    Icons.image_not_supported_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFD9D9D9)),
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
                            ],
                          ),
                          detailController
                                      .argumentData["keterangan_perbaikan"] !=
                                  null
                              ? Column(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(detailController
                                      .argumentData["keterangan_perbaikan"]),
                                ])
                              : SizedBox.shrink()
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
