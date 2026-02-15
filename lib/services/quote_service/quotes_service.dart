import 'package:flutter_quotes_app_getx/constants/api/api_url.dart';
import 'package:http/http.dart' as http;
class QuotesService {

  Future<http.Response> getQuotesByCategory(String categoryId) async {


    final url = '${ApiUrl.get_quotes_by_category_url}?category_id=$categoryId';

    try{
      final response = await http.get(
        Uri.parse(url),
      );
      return response;
    } catch(e){
      print("Error : $e");
      throw Exception(e.toString());
    }

  }

}