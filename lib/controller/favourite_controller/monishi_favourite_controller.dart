import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/constants/utils/all_color.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MonishiFavouriteController extends GetxController {

  var favouriteQuotes = <String>[].obs;

  @override
  void onInit() {
    loadFavourites();
    super.onInit();
  }

  Future<void> loadFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favouriteQuotes.value = prefs.getStringList("favourites") ?? [];
  }

  Future<void> saveFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favourites", favouriteQuotes);
  }

  void toggleFavourite(String quote) {
    if (favouriteQuotes.contains(quote)) {
      favouriteQuotes.remove(quote);
      showToast("removed_from_favourites".tr);
    } else {
      favouriteQuotes.add(quote);
      showToast("added_to_favourites".tr);
    }
    saveFavourites();
  }

 static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AllColor.green,
      textColor: AllColor.white,
      fontSize: 16.0,
    );
  }

  bool isFavourite(String quote) {
    return favouriteQuotes.contains(quote);
  }
}
