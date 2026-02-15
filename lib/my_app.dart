import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/constants/themes/app_themes.dart';
import 'package:flutter_quotes_app_getx/views/bottom_nav/bottom_screen.dart';
import 'package:get/get.dart';
import 'constants/language/app_lang.dart';
import 'constants/language/language_controller.dart';
import 'controller/theme_controller/theme_controller.dart';

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final LanguageController langController = Get.put(LanguageController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeController.currentTheme,
      theme: AppThemes.lightThemes,
      darkTheme: AppThemes.darkThemes,
      translations: AppLang(),
      locale: langController.currentLocale.value,
      fallbackLocale: const Locale('en', 'US'),
      home: BottomScreen(),
    ));
  }
}

