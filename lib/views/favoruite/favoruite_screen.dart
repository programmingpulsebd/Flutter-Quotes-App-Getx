import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/constants/utils/all_color.dart';
import 'package:flutter_quotes_app_getx/views/favoruite/fav_quotes_screen.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller/theme_controller.dart';
import '../../widgets/drawer/custom_drawer.dart';
import 'fav_monishi_screen.dart';

class FavoruiteScreen extends StatelessWidget {
  FavoruiteScreen({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("favourite".tr),
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
            bottom: TabBar(
              indicatorColor: AllColor.primary,
              tabs: [
                Tab(text: "quotes".tr),
                Tab(text: "authors".tr),
              ],
            ),

        ),
        drawer: CustomDrawer(),
        body:  TabBarView(
          children: [

            FavQuotesScreen(),
            FavMonishiScreen(),

          ],
        ),
      ),
    );
  }
}
