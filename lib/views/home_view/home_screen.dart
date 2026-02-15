import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/views/monishi/all_monishi_screen.dart';
import 'package:flutter_quotes_app_getx/views/category/all_category.dart';
import 'package:flutter_quotes_app_getx/views/slider/slider_view.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../controller/theme_controller/theme_controller.dart';
import '../../widgets/category/category_gridview.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/monishi/monishi_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes World".tr),
        actions: [


          Obx(
                () => IconButton(
              icon: Icon(
                themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () {
                themeController.toggleTheme();
              },
            ),
          ),




        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular".tr,
                    style:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AllMonishiScreen());
                    },
                    child: Text(
                      "See All".tr,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              MonishiList(),
              SizedBox(height: 10),
              SliderView(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category".tr,
                    style:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => Get.to(AllCategoryScreen()),
                    child: Text(
                      "See All".tr,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CategoryGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
