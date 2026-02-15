import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constants/api/api_url.dart';
import '../../controller/ad_controller/ad_controller.dart';
import '../../controller/category_controller/category_controller.dart';
import '../../widgets/category/category_card.dart';
import '../../widgets/serach/search_bar.dart';
import 'quotes_screen.dart';

class AllCategoryScreen extends StatelessWidget {
  AllCategoryScreen({super.key});

  final CategoryController controller = Get.put(CategoryController());
  final AdController adController = Get.put(AdController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Category List".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              CustomSearch(),



              // Obx(() {
              //   if (adController.isLoading.value) {
              //     return SizedBox();
              //   }
              //
              //   final ad = adController.bannerAd.value;
              //   if (ad == null) return SizedBox();
              //
              //   return Container(
              //     width: ad.size.width.toDouble(),
              //     height: ad.size.height.toDouble(),
              //     child: AdWidget(ad: ad),
              //   );
              // }),


              SizedBox(height: 20),

              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (controller.filteredList.isEmpty) {
                  return Center(child: Text("No Category Found"));
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.filteredList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 13,
                    crossAxisSpacing: 13,
                  ),
                  itemBuilder: (context, index) {
                    final list = controller.filteredList[index];
                    final imageUrl =
                        '${ApiUrl.category_image_url}${list.image ?? ''}';

                    final colors = [
                      Colors.blue.shade300,
                      Colors.pink.shade300,
                      Colors.orange.shade300,
                      Colors.purple.shade300,
                      Colors.green.shade300,
                    ];

                    return GestureDetector(
                      onTap: () {
                        final id = list.id?.toString() ?? "";
                        if (id.isNotEmpty) {
                          Get.to(() => QuotesScreen(categoryId: id, name: list.name ?? "",));
                        } else {
                          Get.snackbar("Error", "Category ID not found");
                        }
                      },
                      child: CategoryCard(
                        name: list.name!,
                        imageUrl: imageUrl,
                        backgroundColor: colors[index % colors.length],
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
