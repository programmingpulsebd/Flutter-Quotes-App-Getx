import 'dart:async';

import 'package:flutter_quotes_app_getx/controller/favourite_controller/monishi_favourite_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryFavouriteController extends GetxController {
  var favQuote = <String>[].obs;

  @override
  void onInit() {
    loadFav();
    super.onInit();
  }

  void loadFav() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    favQuote.value = sharedPreferences.getStringList("fav") ?? [];
  }

  void saveFab() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("fav", favQuote);
  }

  void toggleFav(String quote) async {
    if (favQuote.contains(quote)) {
      favQuote.remove(quote);
      MonishiFavouriteController.showToast("removed_from_favourites".tr);
    } else {
      favQuote.add(quote);
      MonishiFavouriteController.showToast("added_to_favourites".tr);
    }
    saveFab();
  }


  bool isFav(String quote) {
    return favQuote.contains((quote));
  }
}
