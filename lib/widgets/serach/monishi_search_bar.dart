import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/controller/monishi_controller/monishi_controller.dart';
import 'package:get/get.dart';

import '../../controller/category_controller/category_controller.dart';

class MonishiSearchBar extends StatelessWidget {
  MonishiSearchBar({super.key});

  final MonishiController controller = Get.find<MonishiController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => controller.filterMonishi(value),
        decoration: InputDecoration(
          hintText: "Search Monishi...".tr,
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
