import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../constants/helper/helper.dart';
import '../../constants/utils/all_size.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(color:Theme.of(context).cardColor),
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(

                  ),
                  child: CircleAvatar(
                    radius: 50,

                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Quotes World".tr,
                  style: TextStyle(
                    fontSize: AllSize.appBarTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Divider(),


          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home".tr),
            onTap: () {
              Get.back();
            },
          ),

          ListTile(
            leading: Icon(Icons.star),
            title: Text("rate_app".tr),
            onTap: () {},
          ),


          ListTile(
            leading: Icon(Icons.share),
            title: Text("share_app".tr),
            onTap: () {
              Helper.shareApp();

            },
          ),

          ListTile(
            leading: Icon(Icons.app_blocking),
            title: Text("other_apps".tr),
            onTap: () {
              Helper.openOtherApps();
            }
            ,
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("about_app".tr),
            onTap: () {
              Helper.aboutApp(context);
            },
          ),
          Spacer(),

          Container(
            margin: EdgeInsets.all(15),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 45),
              ),
              onPressed: () {
                Helper.exitApp(context);
              },
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text("exit".tr, style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
