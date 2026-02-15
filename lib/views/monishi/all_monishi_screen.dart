import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/api/api_url.dart';
import '../../controller/monishi_controller/monishi_controller.dart';
import '../../widgets/serach/monishi_search_bar.dart';
import 'monishi_quotes_screen.dart';

class AllMonishiScreen extends StatelessWidget {
  AllMonishiScreen({super.key});

  final MonishiController controller = Get.put(MonishiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Monishi List".tr)),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MonishiSearchBar(),
              const SizedBox(height: 10),

              Obx(() {
                if (controller.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.monishiList.isEmpty) {
                  return Center(child: Text("No Author".tr));
                }
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final monishi = controller.filteredList[index];
                    final url = '${ApiUrl.monishi_image_url}${monishi.image ?? ""}';

                    return InkWell(
                      onTap: () {
                        final id = monishi.id?.toString() ?? "";
                        Get.to(
                          MonishiQuotesScreen(
                            monishiId: id,
                            monishiName: monishi.name ?? "",
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(url),
                            ),
                            title: Text(
                              monishi.name ?? "Unknown".tr,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: controller.filteredList.length,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
