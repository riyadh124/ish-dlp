import 'package:dlp/app/modules/detail/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAddMaterialBottomSheet(
  BuildContext context,
  Function(String, int) addMaterial,
) {
  String? selectedMaterial;
  int count = 0;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButton<String>(
                    value: selectedMaterial,
                    hint: Text('Select Material'),
                    onChanged: (newValue) {
                      setState(() {
                        selectedMaterial = newValue;
                      });
                    },
                    items: <String>[
                      'Material 1',
                      'Material 2',
                      'Material 3',
                      // Add your materials here
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Count',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      DetailController detailController =
                          Get.put(DetailController());
                      setState(() {
                        count = int.tryParse(value) ?? 0;
                      });
                      detailController.update();
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      addMaterial(selectedMaterial!, count);

                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text('Add Material'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
