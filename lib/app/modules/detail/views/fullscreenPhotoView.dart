import 'dart:io';

import 'package:flutter/material.dart';

class FullScreenPhotoView extends StatelessWidget {
  final String photoPath;
  final Function onDelete;

  const FullScreenPhotoView({
    Key? key,
    required this.photoPath,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onDelete();
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Return to the previous screen
          },
          child: Image.file(
            File(photoPath),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
