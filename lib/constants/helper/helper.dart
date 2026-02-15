import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/favourite_controller/monishi_favourite_controller.dart';

class Helper {
  /// Copy Quote
  static void copyQuote(String text) {
    Clipboard.setData(ClipboardData(text: text));


    MonishiFavouriteController.showToast("Quote copied to clipboard");
  }

  /// Share Quote
  static void shareQuote(String text) {
    Share.share(text);
  }

  /// Open Favourite Screen
  static void openFavourite(Widget screen) {
    Get.to(() => screen);
  }

  /// About App Dialog
  static void aboutApp(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "quotes_app".tr,
      applicationVersion: "1.0.0",
      children: [
        Text("about_app_description".tr),
      ],
    );
  }


  /// Share App
  static void shareApp() {
    Share.share(
      "share_app_text".tr,
    );
  }


  /// Rate App
  static Future<void> rateApp() async {
    final url = Uri.parse("https://play.google.com/store/apps/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  /// Other Apps by Developer
  static Future<void> openOtherApps() async {
    final url = Uri.parse(
        "https://play.google.com/store/apps/developer?id=YOUR_DEVELOPER_ID");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> openPrivacyPolicy() async {
    const url = "https://flutter.dev"; // এখানে তোমার মূল URL দাও

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Get.snackbar("Error", "Could not open Privacy Policy URL");
    }
  }


  static Future<void> openSupport() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'xyz2024.bangla@gmail.com',
      query: 'subject=App Support&body=Write your issue here...',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("Error", "Could not open email app");
    }
  }


  /// Exit App
  static void exitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("exit_app_title".tr),
          content: Text("exit_app_content".tr),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("cancel".tr),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text("exit".tr),
            ),
          ],
        );
      },
    );
  }





}
