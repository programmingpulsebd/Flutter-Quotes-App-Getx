import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/helper/helper.dart';
import '../../constants/language/language_controller.dart';
import '../../controller/theme_controller/theme_controller.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../favoruite/favoruite_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final ThemeController themeController = Get.put(ThemeController());
  final langController = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("menu_title".tr),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              menuItem(
                context,
                Icons.favorite,
                "favourite".tr,
                    () {
                      Get.to(() => FavoruiteScreen());

                    },
              ),

              menuItem(
                context,
                Icons.translate,
                "language".tr,
                    () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Select Language",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Divider(),

                            ListTile(
                              title: Text("English"),
                              leading: Icon(Icons.language),
                              onTap: () {

                                langController.changeLanguage('en');
                                Navigator.pop(context);
                              },
                            ),

                            ListTile(
                              title: Text("বাংলা"),
                              leading: Icon(Icons.language),
                              onTap: () {
                                langController.changeLanguage('bn');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

            menuItem(context, Icons.info_outline, "about_app".tr, () {
                Helper.aboutApp(context);
              }),

              menuItem(context, Icons.share, "share_app".tr, () {
                Helper.shareApp();
              }),

              menuItem(context, Icons.star, "rate_app".tr, () {
                Helper.rateApp();
              }),

              menuItem(context, Icons.app_blocking, "other_apps".tr, () {
                Helper.openOtherApps();
              }),

              menuItem(context, Icons.policy, "privacy_policy".tr, () {
                Helper.openPrivacyPolicy();
              }),

              menuItem(context, Icons.help_outline, "help_support".tr, () {
                Helper.openSupport();
              }),

              menuItem(context, Icons.logout, "exit".tr, () {
                Helper.exitApp(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // MENU ITEM
  Widget menuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    Color cardColor = Theme.of(context).cardColor;
    Color iconColor = Theme.of(context).iconTheme.color!;
    Color textColor = Theme.of(context).textTheme.bodyLarge!.color!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
          onTap: onTap,
        ),
      ),
    );
  }
}
