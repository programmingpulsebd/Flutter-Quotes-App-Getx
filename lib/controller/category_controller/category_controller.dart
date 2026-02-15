import 'dart:convert';
import 'package:get/get.dart';
import '../../model/category/category_model.dart';
import '../../services/category_service/category_service.dart';

class CategoryController extends GetxController {
  var categoryList = <Categories>[].obs;
  var limitedList = <Categories>[].obs;
  var filteredList = <Categories>[].obs;
  var isLoading = false.obs;

  final CategoryService categoryService = CategoryService();

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory() async {
    try {
      isLoading.value = true;

      final response = await categoryService.getCategory();

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        List data = result["categories"];

        categoryList.assignAll(
            data.map((e) => Categories.fromJson(e)).toList()
        );

        // Set filtered list to all categories initially
        filteredList.assignAll(categoryList);

        // Create a list of only first 12 categories
        limitedList.assignAll(categoryList.take(12).toList());

      } else {
        print("Error : ${response.statusCode}");
      }

    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  // Search Filter
  void filterCategory(String search) {
    if (search.isEmpty) {
      filteredList.assignAll(categoryList);
    } else {
      filteredList.assignAll(
          categoryList.where((c) =>
              c.name!.toLowerCase().contains(search.toLowerCase()))
      );
    }
  }
}
