import 'dart:convert';
import 'package:http/http.dart' as http;

class InvidiousApi {

  //Invidious api
  final String url = 'https://api.invidious.io/instances.json?pretty=1&sort_by=type,users';
  
  ///A function that fetches the API and returns it as Map<String, dynamic>.
  Future get() async {
    final httpClient = http.Client();
    try {
      final response = await httpClient.get(Uri.parse(url));
      httpClient.close();
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
      //Catch the error if there is no internet connection.
    } on http.ClientException catch (e) {e.message;}
  }
}
