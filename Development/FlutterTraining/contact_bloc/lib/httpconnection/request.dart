import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class Request {
  Future<dynamic> get(String url) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = jsonDecode(response.body);
    } on SocketException {
      // throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
