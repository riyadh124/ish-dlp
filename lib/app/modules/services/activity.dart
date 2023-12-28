// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ActivityService extends GetConnect {
  GetStorage box = GetStorage();

  // void getListActivity(q, category) async {
  //   List activities = [];

  //   DetailGiatController detailGiatController = Get.put(DetailGiatController());

  //   try {
  //     final response = await get(
  //         '$urlApi/activity?q=$q&category=$category&status=APPROVE',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       data['data'].forEach((v) => activities.add(v));
  //       detailGiatController.setActivitiesData(activities);
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void getListActivityWaiting(status) async {
  //   List activities = [];

  //   WaitingActivityController waitingActivityController =
  //       Get.put(WaitingActivityController());

  //   try {
  //     final response = await get('$urlApi/activity?status=$status',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       data['data'].forEach((v) => activities.add(v));
  //       waitingActivityController.setActivitiesData(activities);
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void getListActivitySearch(q) async {
  //   List activities = [];

  //   SearchActivityController searchActivityController =
  //       Get.put(SearchActivityController());

  //   try {
  //     final response = await get('$urlApi/activity?q=$q&status=APPROVE',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       data['data'].forEach((v) => activities.add(v));
  //       searchActivityController.setActivitiesData(activities);
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void getListActivityTab(q) async {
  //   List activities = [];

  //   ActivityTabController activityTabController =
  //       Get.put(ActivityTabController());

  //   try {
  //     final response = await get('$urlApi/activity?q=$q',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       data['data'].forEach((v) => activities.add(v));
  //       activityTabController.setActivitiesData(activities);
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void getListActivityCalendar() async {
  //   List<Meeting> activities = [];

  //   HomeController homeController = Get.put(HomeController());

  //   try {
  //     final response = await get('$urlApi/activity?q=&category=&status=APPROVE',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       data['data'].forEach((v) => activities.add(Meeting(
  //           v,
  //           v['title'],
  //           DateTime.parse(v['start_time']),
  //           DateTime.parse(v['start_time']).add(const Duration(hours: 2)),
  //           const Color(0xFF0F8644),
  //           true)));
  //       homeController.setActivitiesData(activities);
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void getDetailActivity(id) async {
  //   DetailAktivitasController detailAktivitasController =
  //       Get.put(DetailAktivitasController());

  //   try {
  //     final response = await get('$urlApi/activity/$id',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       detailAktivitasController.setActivityData(data["data"]);
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void getListCategory(id) async {
  //   AddActivityController addActivityController =
  //       Get.put(AddActivityController());

  //   addActivityController.categoryTextEdit = [];

  //   try {
  //     final response = await get('$urlApi/activity/category/$id',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("id category : $id");
  //     print("data list category : $data");
  //     if (data != null) {
  //       data['data'].forEach((v) => addActivityController.categoryTextEdit.add(
  //           {"name": v["named_param"], "controller": TextEditingController()}));
  //       addActivityController.update();
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void createActivity(context) async {
  //   AddActivityController addActivityController =
  //       Get.put(AddActivityController());

  //   switch (addActivityController.selectedValue) {
  //     case "1":
  //       addActivityController.categoryTextEditingController.text =
  //           "GIAT_MASYARAKAT_KEAGAMAAN";
  //       break;
  //     case "2":
  //       addActivityController.categoryTextEditingController.text =
  //           "GIAT_MASYARAKAT_OLAHRAGA";
  //       break;
  //     case "3":
  //       addActivityController.categoryTextEditingController.text =
  //           "GIAT_MASYARAKAT_KONSER";
  //       break;
  //     case "4":
  //       addActivityController.categoryTextEditingController.text =
  //           "GIAT_MASYARAKAT_UMUM";
  //       break;
  //     case "5":
  //       addActivityController.categoryTextEditingController.text =
  //           "GIAT_AKSI_UNRAS";
  //       break;
  //     case "6":
  //       addActivityController.categoryTextEditingController.text =
  //           "GIAT_POLITIK";
  //       break;
  //     default:
  //       addActivityController.categoryTextEditingController.text =
  //           "GIAT_MASYARAKAT_KEAGAMAAN";
  //   }

  //   print(
  //       "addActivityController.categoryTextEditingController.text : ${addActivityController.categoryTextEditingController.text}");
  //   print(
  //       "addActivityController.titleTextEditingController.text : ${addActivityController.titleTextEditingController.text}");
  //   print(
  //       "addActivityController.locationTextEditingController.text : ${addActivityController.locationTextEditingController.text}");
  //   print(
  //       "addActivityController.addressTextEditingController.text : ${addActivityController.addressTextEditingController.text}");
  //   print(
  //       "addActivityController.start_timeTextEditingController.text : ${addActivityController.start_timeTextEditingController.text}");
  //   print(
  //       "addActivityController.done_timeTextEditingController.text : ${addActivityController.done_timeTextEditingController.text}");
  //   print(
  //       "addActivityController.pic_typeTextEditingController.text : ${addActivityController.pic_typeTextEditingController.text}");
  //   print(
  //       "addActivityController.picTextEditingController.text : ${addActivityController.picTextEditingController.text}");
  //   print(
  //       "addActivityController.pic_contactTextEditingController.text : ${addActivityController.pic_contactTextEditingController.text}");
  //   print(
  //       "addActivityController.permitTextEditingController.text : ${addActivityController.permitTextEditingController.text}");
  //   print(
  //       "addActivityController.is_permit_okTextEditingController.text : ${addActivityController.is_permit_okTextEditingController.text}");

  //   if (addActivityController.categoryTextEditingController.text != '' &&
  //       addActivityController.titleTextEditingController.text != '' &&
  //       addActivityController.locationTextEditingController.text != '' &&
  //       addActivityController.addressTextEditingController.text != '' &&
  //       addActivityController.start_timeTextEditingController.text != '' &&
  //       addActivityController.done_timeTextEditingController.text != '' &&
  //       addActivityController.pic_typeTextEditingController.text != '' &&
  //       addActivityController.picTextEditingController.text != '' &&
  //       addActivityController.pic_contactTextEditingController.text != '' &&
  //       addActivityController.permitTextEditingController.text != '' &&
  //       addActivityController.is_permit_okTextEditingController.text != '') {
  //     try {
  //       onLoading(context);

  //       var body = {
  //         "category": addActivityController.categoryTextEditingController.text,
  //         "title": addActivityController.titleTextEditingController.text,
  //         "location": addActivityController.locationTextEditingController.text,
  //         "address": addActivityController.addressTextEditingController.text,
  //         "start_time":
  //             addActivityController.start_timeTextEditingController.text,
  //         "done_time":
  //             addActivityController.done_timeTextEditingController.text,
  //         "pic_type": addActivityController.pic_typeTextEditingController.text,
  //         "pic": addActivityController.picTextEditingController.text,
  //         "pic_contact":
  //             addActivityController.pic_contactTextEditingController.text,
  //         "permit": addActivityController.permitTextEditingController.text,
  //         "is_permit_ok": int.parse(
  //             addActivityController.is_permit_okTextEditingController.text),
  //       };

  //       for (int i = 0;
  //           i < addActivityController.categoryTextEdit.length;
  //           i++) {
  //         body.addAll({
  //           addActivityController.categoryTextEdit[i]["name"]:
  //               "${addActivityController.categoryTextEdit[i]["controller"].text}"
  //         });
  //       }

  //       print("body : $body");

  //       final response = await post(
  //         '$urlApi/activity',
  //         body,
  //         headers: {'Authorization': box.read('user')["number"]},
  //       );

  //       var data = response.body;
  //       print("data create activity  : $data");

  //       if (data['message'] == 'Create Activity Success') {
  //         onLoadingDismiss(context);

  //         Get.offAll(TabDeciderView());
  //         getListActivityCalendar();
  //         successMessage(context, data['message']);
  //       } else if (data['message'] ==
  //           'Unauthorized: Missing authentication token') {
  //         onLoadingDismiss(context);

  //         Get.offAll(LoginView());
  //         errorMessage(data['message']);
  //       } else {
  //         onLoadingDismiss(context);

  //         errorMessage(data['message']);
  //       }
  //     } catch (e) {
  //       onLoadingDismiss(context);

  //       errorMessage(e);
  //     }
  //   } else {
  //     errorMessage("Semua Form Wajib Diisi!");
  //   }
  // }

  // Future<List<String>> getListPic() async {
  //   AddActivityController addActivityController =
  //       Get.put(AddActivityController());

  //   List<String> items = [];
  //   final response = await get('$urlApi/activity/ref',
  //       headers: {'Authorization': box.read('user')["number"]});
  //   var data = response.body;

  //   print("data list pic : $data");
  //   if (data != null) {
  //     data["data"]["pic"].forEach((v) => items.add(v["value"]));
  //     addActivityController.pic_typeTextEditingController.text = items[0];
  //     print(
  //         "pic type text : ${addActivityController.pic_typeTextEditingController}");
  //     addActivityController.update();
  //     return items;
  //   } else {
  //     errorMessage(data["message"]);

  //     throw response.statusCode!;
  //   }
  // }

  // Future<List<String>> getListPermit() async {
  //   AddActivityController addActivityController =
  //       Get.put(AddActivityController());

  //   List<String> items = [];
  //   final response = await get('$urlApi/activity/ref',
  //       headers: {'Authorization': box.read('user')["number"]});
  //   var data = response.body;

  //   print("data list pic : $data");
  //   if (data != null) {
  //     data["data"]["permit"].forEach((v) => items.add(v["value"]));
  //     addActivityController.permitTextEditingController.text = items[0];
  //     addActivityController.update();
  //     return items;
  //   } else {
  //     errorMessage(data["message"]);

  //     throw response.statusCode!;
  //   }
  // }

  // void getListUser(q, status) async {
  //   List users = [];

  //   ListUserController listUserController = Get.put(ListUserController());

  //   try {
  //     final response = await get('$urlApi/user?status=$status&q=$q',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       data['data'].forEach((v) => users.add(v));
  //       listUserController.setUsersData(users);
  //     }
  //   } catch (e) {
  //     errorMessage(e);
  //   }
  // }

  // void userUpdate(context, id, status) async {
  //   ListUserController listUserController = Get.put(ListUserController());

  //   try {
  //     onLoading(context);
  //     final response = await patch('$urlApi/user/$id', {"status": status},
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       onLoadingDismiss(context);

  //       successMessage(context, data["message"]);
  //       getListUser("", "WAITING");
  //       listUserController.selectedValue = "WAITING";
  //     }
  //   } catch (e) {
  //     onLoadingDismiss(context);

  //     errorMessage(e);
  //   }
  // }

  // void userUpdateData(context, userData) async {
  //   ListUserController listUserController = Get.put(ListUserController());

  //   try {
  //     onLoading(context);
  //     final response = await patch('$urlApi/user/${userData["id"]}', {
  //       "status": "${userData["status"]}",
  //       "name": "${userData["name"]}",
  //       "division": "${userData["division"]}",
  //       "number": "${userData["number"]}",
  //       // "password": "${userData["password"]}",
  //     }, headers: {
  //       'Authorization': box.read('user')["number"]
  //     });
  //     var data = response.body;

  //     print("data update user : $data");

  //     if (data != null) {
  //       onLoadingDismiss(context);

  //       successMessage(context, data["message"]);
  //       getListUser("", "APPROVED");
  //       listUserController.selectedValue = "APPROVED";
  //     }
  //   } catch (e) {
  //     onLoadingDismiss(context);

  //     errorMessage(e);
  //   }
  // }

  // void userUpdatePassword(context, id, password, verifPassword) async {
  //   ListUserController listUserController = Get.put(ListUserController());

  //   if (password == verifPassword) {
  //     try {
  //       onLoading(context);
  //       final response = await patch('$urlApi/user/$id', {
  //         "password": password,
  //       }, headers: {
  //         'Authorization': box.read('user')["number"]
  //       });
  //       var data = response.body;

  //       print("data update user : $data");

  //       if (data != null) {
  //         onLoadingDismiss(context);

  //         successMessage(context, data["APPROVED"]);
  //         getListUser("", "WAITING");
  //         listUserController.selectedValue = "WAITING";
  //       }
  //     } catch (e) {
  //       onLoadingDismiss(context);

  //       errorMessage(e);
  //     }
  //   } else {
  //     errorMessage("Password tidak sama.");
  //   }
  // }

  // void deleteUser(context, id) async {
  //   ListUserController listUserController = Get.put(ListUserController());

  //   try {
  //     onLoading(context);
  //     final response = await delete('$urlApi/user/$id',
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data update user : $data");

  //     if (data != null) {
  //       Get.back();
  //       Get.back();
  //       onLoadingDismiss(context);
  //       successMessage(context, data["message"]);
  //       getListUser("", "APPROVED");
  //       listUserController.selectedValue = "APPROVED";
  //     }
  //   } catch (e) {
  //     onLoadingDismiss(context);

  //     errorMessage(e);
  //   }
  // }

  // void activityUpdate(context, id, status) async {
  //   DetailAktivitasController detailAktivitasController =
  //       Get.put(DetailAktivitasController());

  //   try {
  //     onLoading(context);
  //     final response = await patch(
  //         '$urlApi/activity/$id', {"status_approval": status},
  //         headers: {'Authorization': box.read('user')["number"]});
  //     var data = response.body;

  //     print("data activity : $data");

  //     if (data != null) {
  //       onLoadingDismiss(context);
  //       successMessage(context, data["message"]);
  //       getDetailActivity(id);
  //       getListActivityWaiting("WAITING");
  //       getListActivityCalendar();
  //     }
  //   } catch (e) {
  //     onLoadingDismiss(context);

  //     errorMessage(e);
  //   }
  // }
}
