import 'dart:convert';

import 'package:flutter_quotes_app_getx/model/quotes/quote_model.dart';
import 'package:flutter_quotes_app_getx/services/quote_service/quotes_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuoteController extends GetxController {
  RxList<QuoteModel> quoteList = <QuoteModel>[].obs;
  RxBool isLoading = false.obs;

  final QuotesService quoteService = QuotesService();



  void fetchQuote(String categoryId) async {
    try {
      isLoading.value = true;

      final response = await quoteService.getQuotesByCategory(categoryId);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print("Response body: ${response.body}");
        List data = result['quotes'];

        quoteList.clear();
        for (var item in data) {
          quoteList.add(QuoteModel.fromJson(item));
        }
      } else {
        print("ERROR : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
