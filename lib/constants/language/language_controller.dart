import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {

  var currentLocale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    loadLanguage();
  }

  void changeLanguage(String langCode) async {
    if (langCode == 'bn') {
      currentLocale.value = const Locale('bn', 'BD');
    } else {
      currentLocale.value = const Locale('en', 'US');
    }

    Get.updateLocale(currentLocale.value);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', langCode);
  }

  void loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString('language_code');

    if (langCode != null) {
      if (langCode == 'bn') {
        currentLocale.value = const Locale('bn', 'BD');
      } else {
        currentLocale.value = const Locale('en', 'US');
      }
      Get.updateLocale(currentLocale.value);
    }
  }
}
