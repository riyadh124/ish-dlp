import 'package:dlp/app/modules/services/auth.dart';
import 'package:dlp/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  @override
  LoginController loginController = Get.put(LoginController());
  AuthService authService = AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (c) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Form(
                  key: loginController.loginFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak boleh kosong!';
                            }
                            return null;
                          },
                          controller: c.email,
                          onChanged: (value) {
                            c.email.text = value;
                            print(c.email.text);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak boleh kosong!';
                            }
                            return null;
                          },
                          controller: c.password,
                          onChanged: (value) {
                            c.password.text = value;
                            print(c.password.text);
                          },
                          obscureText: c.obscureText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.shield),
                            suffixIcon: IconButton(
                              onPressed: () {
                                c.setObscure(!c.obscureText);
                              },
                              icon: Icon(!c.obscureText
                                  ? Icons.visibility
                                  : Icons.remove_red_eye),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        PrimaryButton(
                            text: 'Masuk',
                            onTap: () {
                              if (loginController.loginFormKey.currentState!
                                  .validate()) {
                                // ActivityService().getData();
                                authService.login(
                                    context, c.email.text, c.password.text);
                              }
                            }),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
