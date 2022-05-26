import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vehicle_service_center_app/const/widget_size.dart';

import '../widgets/atoms/app_label.dart';
import 'app_colors.dart';

class CustomDialogBox {
  static buildDialogBox({String? text}) {
    Get.defaultDialog(
        title: "",
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.all(30),
        barrierDismissible: false,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: AppColors.appColorBlack,
            ),
            SizedBox(
              height: 10,
            ),
            AppLabel(text: text ?? "Please wait!", widgetSize: WidgetSize.large)
          ],
        ));
  }

  static buildConfirmOrCancelDialog(
      {String title = "Alert",
      required String description,
      String confirmText = "Ok",
      String cancelText = "Cancel",
      Widget? content,
      required Function confirmEvent}) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      title: title,
      middleText: description,
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: AppColors.appColorBlack),
      middleTextStyle: const TextStyle(color: AppColors.appColorBlack),
      buttonColor: AppColors.appColorBlack,
      barrierDismissible: false,
      radius: 6,
      actions: [
        TextButton(
            onPressed: () {
              confirmEvent();
            },
            child: Text(
              confirmText,
              style: const TextStyle(
                  color: AppColors.appColorBlack, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          width: 30,
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(cancelText,
              style: const TextStyle(
                  color: AppColors.appColorBlack, fontWeight: FontWeight.bold)),
        )
      ],
      content: content,
    );
  }
}
