import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quotes_app_getx/constants/utils/all_color.dart';
import 'package:flutter_quotes_app_getx/controller/bottom_controller/bottom_controller.dart';
import 'package:flutter_quotes_app_getx/views/favoruite/favoruite_screen.dart';
import 'package:flutter_quotes_app_getx/views/home_view/home_screen.dart';
import 'package:flutter_quotes_app_getx/views/menu/menu_screen.dart';
import 'package:get/get.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});

  final List<Widget> page = [HomeScreen(), FavoruiteScreen(), MenuScreen()];
  final BottomController bottomController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        body: Obx(() {
          return page[bottomController.selectedIndex.value];
        }),
        bottomNavigationBar: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomNavigationBar(
                elevation: 3,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home".tr,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outlined),
                    label: "favourite".tr,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: "menu_title".tr,
                  ),
                ],
                currentIndex: bottomController.selectedIndex.value,
                onTap: (value) {
                  bottomController.currentIndex(value);
                },
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AllColor.primary,
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<bool> onBackPressed(BuildContext context) async {
    bool exit = false;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("exit_app_title".tr),
          content: Text("exit_app_content".tr),
          actions: [
            TextButton(
              onPressed: () {
                exit = false;
                Navigator.pop(context);
              },
              child: Text("cancel".tr),
            ),
            TextButton(
              onPressed: () {
                exit = true;
                Navigator.pop(context);
              },
              child: Text("exit".tr),
            ),
          ],
        );
      },
    );

    if (exit) SystemNavigator.pop();
    return false;
  }



}
