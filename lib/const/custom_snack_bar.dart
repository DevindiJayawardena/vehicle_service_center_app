import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class CustomSnackBar {
  static buildSnackBar(
      {required String title, required String message, Color? bgColor}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.appColorBlack,
        duration: Duration(seconds: 4),
        colorText: AppColors.appColorWhite,
        borderRadius: 10,
        margin: EdgeInsets.all(24),
        animationDuration: Duration(milliseconds: 1000));
  }

  static buildActionSnackBar(
      {required String title,
      required String message,
      Color? bgColor,
      required String actionText,
      required Function action}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.appColorBlack,
        duration: Duration(seconds: 10),
        colorText: AppColors.appColorWhite,
        borderRadius: 10,
        margin: EdgeInsets.all(24),
        animationDuration: Duration(milliseconds: 1000),
        mainButton: TextButton(
            onPressed: () {
              action();
            },
            child: Text(
              actionText,
              style: TextStyle(color: AppColors.appColorYellow),
            )));
  }
}
