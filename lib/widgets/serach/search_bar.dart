import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/category_controller/category_controller.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({super.key});

  final CategoryController controller = Get.find<CategoryController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => controller.filterCategory(value),
        decoration: InputDecoration(
          hintText: "Search Category...".tr,
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
