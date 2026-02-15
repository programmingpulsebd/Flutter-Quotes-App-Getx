import 'package:http/http.dart' as http;

import '../../constants/api/api_url.dart';
class MonishiService {


  Future<http.Response> getMonishi() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.get_monishi_url),
      );
      return response;
    }
    catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<http.Response> getMonishiByQuotes (String monishiId ) async {

    final url = '${ApiUrl.get_monishi_quotes_url}?monishi_id=$monishiId';


    try{

      final response = await http.get(
        Uri.parse(url),
      );



      return response;




    } catch(e){
      throw Exception(e.toString());
    }


  }


}