import 'package:dlp/app/modules/detail/views/detail_view.dart';
import 'package:dlp/app/modules/env/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leadingWidth: 250,
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riyadh Asjad Mulyadi",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "08115991111",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GetBuilder(
              init: HomeController(),
              builder: (_) {
                return Container(
                  height: 70,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border(
                        top: BorderSide(color: Color(0xFFCA6A79)),
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.texts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            homeController.selectedIndex = index;
                            homeController.update();
                          },
                          child: Container(
                            // height: 20,
                            margin: EdgeInsets.only(
                                top: 20.0, left: 15, bottom: 20),
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10),
                            decoration: BoxDecoration(
                              color: homeController.selectedIndex == index
                                  ? Color(0xFFCA4F63)
                                  : null,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              homeController.texts[index],
                              style: TextStyle(
                                fontSize: 14.0,
                                color: homeController.selectedIndex == index
                                    ? Colors.white
                                    : Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Get.to(DetailView()),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFE3E5EB)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: green,
                          maxRadius: 15,
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "GT2023001",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Spacer(),
                                  Text(
                                    "8 / 12 / 2023",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width / 2 -
                                              40,
                                      child: Text(
                                        "Distribusi - Regional VI, Wilayah ABC",
                                        style: TextStyle(fontSize: 14),
                                      )),
                                  Text(
                                    "Done",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: green,
                                        fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
