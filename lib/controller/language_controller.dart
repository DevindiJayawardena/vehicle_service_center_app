import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final _box = GetStorage();
  final _lngBox = GetStorage();

  final langBox = GetStorage('langBox');

  @override
  void onInit() {
    super.onInit();
  }

  void changeLanguage(String param1, String param2) {
    langBox.write("param1", param1);
    langBox.write("param2", param2);
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }

  Locale? getLocale() {
    if (langBox.hasData("param1") && langBox.hasData("param2")) {
      return Locale(langBox.read("param1"), langBox.read("param2"));
    }
    return null;
  }
}
