import 'package:flutter_easyloading/flutter_easyloading.dart';

void onLoading(context) {
  EasyLoading.show(
    status: 'loading...',
    maskType: EasyLoadingMaskType.black,
  );
  print('EasyLoading show');
}

void onLoadingDismiss(context) {
  print("EasyLoading END");
  EasyLoading.dismiss();
}
