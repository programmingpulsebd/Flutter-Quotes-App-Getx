import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/constants/utils/all_color.dart';
import 'package:flutter_quotes_app_getx/constants/utils/all_size.dart';

class AppThemes {
  static final lightThemes = ThemeData(
    scaffoldBackgroundColor: AllColor.white,
    brightness: Brightness.light,
    fontFamily: "Poppins",
    primaryColor: AllColor.primary,
    cardColor: CupertinoColors.systemGrey6,
    appBarTheme: AppBarTheme(
      elevation: 3,
      centerTitle: true,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AllColor.black),
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
        color: AllColor.black,
        fontSize: AllSize.appBarTitleSize,
      ),
    ),
  );

  static final darkThemes = ThemeData(
    scaffoldBackgroundColor: AllColor.black,
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    primaryColor: AllColor.primary,
    cardColor: CupertinoColors.secondaryLabel,
    appBarTheme: AppBarTheme(
      elevation: 3,
      centerTitle: true,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AllColor.white),
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
        color: AllColor.white,
        fontSize: AllSize.appBarTitleSize,
      ),
    ),
  );
}
