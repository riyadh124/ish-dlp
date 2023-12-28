import 'package:dlp/app/modules/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void confirmMessage(context, title, description, VoidCallback action) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleBoxDialog(
        title: title,
        subtitle: description,
        buttonText: 'Konfirmasi',
        secondaryButtonText: 'Batal',
        onTapSecondary: () {
          Get.back();
        },
        onTapPrimary: action,
      );
    },
  );
}

void errorMessage(message) {
  Get.dialog(SimpleBoxDialog(
    title: 'Terjadi Kesalahan',
    subtitle: message.toString(),
    buttonText: 'Tutup',
    onTapPrimary: () {
      Get.back();
    },
  ));
}

void successMessage(context, message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleBoxDialog(
        title: 'Berhasil',
        subtitle: message.toString(),
        buttonText: 'Tutup',
        onTapPrimary: () {
          Get.back();
        },
      );
    },
  );
}
