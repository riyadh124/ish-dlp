import 'package:dlp/app/modules/components/dialog.dart';
import 'package:dlp/app/modules/components/loading.dart';
import 'package:dlp/app/modules/env/global_var.dart';
import 'package:dlp/app/modules/tabDecider/views/tab_decider_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetConnect {
  GetStorage box = GetStorage();

  void login(context, email, password) async {
    if (email != '' && password != '') {
      onLoading(context);
      print("email : ${email}, password: ${password}");

      try {
        final response = await post('$urlApi/api/auth/login', {
          'email': email,
          'password': password,
        });

        print("data response : ${response.body}");

        var data = response.body;

        if (data['message'] == 'User Logged In Successfully') {
          onLoadingDismiss(context);
          box.write('user', data['data']);
          box.write('token', data['token']);
          Get.offAll(TabDeciderView());
          successMessage(context, data['message']);
        } else {
          onLoadingDismiss(context);
          errorMessage(data['message']);
        }
      } catch (e) {
        onLoadingDismiss(context);
        errorMessage(e);
      }
    }
  }

  // void register(context) async {
  //   RegisterController registerController = Get.put(RegisterController());
  //   var url = '$urlApi/user';

  //   if (registerController.password.text ==
  //       registerController.verifPassword.text) {
  //     if (registerController.telepon.text != '' &&
  //         registerController.name.text != '' &&
  //         registerController.division.text != '' &&
  //         registerController.password.text != '' &&
  //         registerController.verifPassword.text != '') {
  //       onLoading(context);

  //       try {
  //         var body = {
  //           'name': registerController.name.text,
  //           'number': registerController.telepon.text,
  //           'division': registerController.division.text,
  //           'password': registerController.password.text,
  //         };

  //         var postResponse = await post(url, body);

  //         if (postResponse.statusCode == 200) {
  //           var responseJson = postResponse.body;
  //           print('Response JSON: $responseJson');
  //           onLoadingDismiss(context);

  //           successMessage(context, responseJson["message"]);
  //           Get.offAll(LoginView());
  //         } else {
  //           var message =
  //               postResponse.body["message"] ?? 'Gagal melakukan registrasi';
  //           onLoadingDismiss(context);

  //           errorMessage(message);
  //           print(errorMessage);
  //         }
  //       } catch (e) {
  //         onLoadingDismiss(context);

  //         errorMessage(e);
  //       }
  //     } else {
  //       errorMessage("Ada data yang kosong");
  //     }
  //   } else {
  //     errorMessage("Password Tidak Sama");
  //   }
  // }

  // void createAccount(context) async {
  //   CreateUserController c = Get.put(CreateUserController());
  //   ActivityService activityService = ActivityService();

  //   var url = '$urlApi/user';

  //   if (c.password.text == c.verifPassword.text) {
  //     if (c.telepon.text != '' &&
  //         c.name.text != '' &&
  //         c.division.text != '' &&
  //         c.password.text != '' &&
  //         c.verifPassword.text != '') {
  //       onLoading(context);

  //       try {
  //         var body = {
  //           'name': c.name.text,
  //           'number': c.telepon.text,
  //           'division': c.division.text,
  //           'password': c.password.text,
  //         };

  //         var postResponse = await post(url, body);

  //         if (postResponse.statusCode == 200) {
  //           var responseJson = postResponse.body;
  //           print('Response JSON: $responseJson');
  //           Get.back();
  //           Get.back();
  //           activityService.getListUser("", "WAITING");
  //           onLoadingDismiss(context);
  //           successMessage(context, responseJson["message"]);
  //         } else {
  //           var message =
  //               postResponse.body["message"] ?? 'Gagal melakukan registrasi';
  //           onLoadingDismiss(context);

  //           errorMessage(message);
  //           print(errorMessage);
  //         }
  //       } catch (e) {
  //         onLoadingDismiss(context);

  //         errorMessage(e);
  //       }
  //     } else {
  //       errorMessage("Ada data yang kosong");
  //     }
  //   } else {
  //     errorMessage("Password Tidak Sama");
  //   }
  // }
}
