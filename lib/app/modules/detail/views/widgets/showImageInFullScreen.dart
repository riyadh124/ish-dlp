import 'dart:io';

import 'package:dlp/app/modules/env/global_var.dart';
import 'package:flutter/material.dart';

void showImageInFullScreen(BuildContext context, String imagePath) {
  Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Hero(
                tag: imagePath,
                child: Image.network(
                  "${urlApi}/storage/${imagePath}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
