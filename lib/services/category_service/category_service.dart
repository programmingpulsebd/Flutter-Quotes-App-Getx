import 'package:flutter_quotes_app_getx/constants/api/api_url.dart';
import 'package:http/http.dart' as http;

class CategoryService {


  Future<http.Response> getCategory() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.get_category_url),
      );
      return response;
    }
    catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

}







