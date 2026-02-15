import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/constants/api/api_url.dart';
import 'package:flutter_quotes_app_getx/controller/monishi_controller/monishi_controller.dart';
import 'package:flutter_quotes_app_getx/views/monishi/monishi_quotes_screen.dart';
import 'package:get/get.dart';
import '../shimmer/category_gird_shimmer_card.dart';

class MonishiList extends StatelessWidget {
  MonishiList({super.key});

  final MonishiController controller = Get.put(MonishiController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Obx(() {
        if (controller.loading.value) {
          return CategoryShimmerGrid();
        }
        if (controller.monishiList.isEmpty) {
          return Text("No Author".tr);
        }
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final monishi = controller.monishiList[index];
            final url = '${ApiUrl.monishi_image_url}${monishi.image ?? ""}';

            return InkWell(
              onTap: () {
                final id = monishi.id?.toString() ?? "";
                Get.to(
                  MonishiQuotesScreen(
                    monishiId: id,
                    monishiName: monishi.name ?? "Unknown".tr,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(url),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      monishi.name ?? "Unknown".tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, snapshot) {
            return const SizedBox(width: 20);
          },
          itemCount: controller.monishiList.length,
        );
      }),
    );
  }
}
