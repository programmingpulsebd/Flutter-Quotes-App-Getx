import 'package:flutter_quotes_app_getx/constants/api/api_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SliderService {
  final String apiUrl = ApiUrl.get_slider_url;

  Future<List<String>> fetchImages() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final images = data['images'] as List;
      return images.map((e) => e['image'].toString()).toList();
    } else {
      throw Exception("Failed to load images");
    }
  }
}
