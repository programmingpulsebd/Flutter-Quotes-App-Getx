import 'dart:convert';
import 'package:get/get.dart';

import '../../model/monishi/monishi_model.dart';
import '../../model/monishi/monishi_quotes.dart';
import '../../services/monishi_service/monishi_service.dart';

class MonishiController extends GetxController {

  var monishiList = <MonishiModel>[].obs;
  var quotes_list = <Quotes>[].obs;
  var loading = false.obs;

  var filteredList = <MonishiModel>[].obs;


  final MonishiService monishiService = MonishiService();

  @override
  void onInit() {
    super.onInit();
    fetchMonishi();
  }

  Future<void> fetchMonishi() async {
    try {
      loading.value = true;

      final response = await monishiService.getMonishi();

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        monishiList.clear();

        for (var item in result) {
          monishiList.add(MonishiModel.fromJson(item));
        }

        filteredList.assignAll(monishiList);


      } else {
        print("Error fetching Monishi: ${response.statusCode}");
      }

    } catch (e) {
      print("fetchMonishi Error: $e");
    } finally {
      loading.value = false;
    }
  }


  Future<void> fethchQuote(String monishiId) async {
    try {
      loading.value = true;

      final response = await monishiService.getMonishiByQuotes(monishiId);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        print("QUOTES API RESPONSE: $result");

        quotes_list.clear();

        List data = result["quotes"] ?? [];

        print("QUOTES API RESPONSE: $result");


        if (data is List) {
          for (var item in data) {
            quotes_list.add(Quotes.fromJson(item));
          }
        }

      } else {
        print("Error fetching Quotes: ${response.statusCode}");
      }

    } catch (e) {
      print("fethchQuote Error: $e");
    } finally {
      loading.value = false;
    }
  }

  void filterMonishi(String search) {
    if (search.isEmpty) {
      filteredList.assignAll(monishiList);
    } else {
      filteredList.assignAll(
          monishiList.where((c) =>
              c.name!.toLowerCase().contains(search.toLowerCase()))
      );
    }
  }

}
