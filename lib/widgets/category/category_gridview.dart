import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/controller/favourite_controller/monishi_favourite_controller.dart';
import 'package:get/get.dart';

import '../../constants/api/api_url.dart';
import '../../controller/category_controller/category_controller.dart';
import '../../views/category/quotes_screen.dart';
import '../category/category_card.dart';
import '../shimmer/category_gird_shimmer_card.dart';

class CategoryGridView extends StatelessWidget {
  CategoryGridView({super.key});

  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const CategoryShimmerGrid();
      }

      if (controller.limitedList.isEmpty) {
        return Center(child: Text("No Category Found".tr));

      }

      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.limitedList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
        ),
        itemBuilder: (context, index) {
          final list = controller.limitedList[index];
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
                Get.snackbar("Error", "");
                MonishiFavouriteController.showToast("Category ID not found".tr);

              }



            },
            child: CategoryCard(
              name: list.name ?? "",
              imageUrl: imageUrl,
              backgroundColor: colors[index % colors.length],
            ),
          );
        },
      );
    });
  }
}
