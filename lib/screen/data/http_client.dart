import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

class HttpClient {
  HttpClient();
  getReques(String url) async {
    try {
      var respons = await http.get(Uri.parse(url));
      if (respons.statusCode == 200) {
        var responsbody = jsonDecode(respons.body);

        return responsbody;
      } else {
        print('error${respons.statusCode}');
      }
    } catch (e) {
      print('error catch $e');
    }
  }

  postReques(String url, Map data) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      var respons = await http.post(Uri.parse(url), body: data);
      if (respons.statusCode == 200) {
        var responsbody = jsonDecode(respons.body);

        return responsbody;
      } else {
        print('error${respons.statusCode}');
      }
    } catch (e) {
      print('error catch $e');
    }
  }
}
