import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InternetFetcher {
  var apikey = '739e006e-0612-4134-9c08-f006acd11d8a';
  static Future<String> fetchIp() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'));
      var jsonData = response.body;
      var obj = jsonDecode(jsonData);
      print(response.body);
      return obj['id'];
    } catch (e) {
      print(e);
      return '';
    }
  }
}



/*class InternetFetcher {
  var apikey = '739e006e-0612-4134-9c08-f006acd11d8a';
  static Future<String> fetchIp() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://api.myip.com/'));
      var jsonData = response.body;
      var obj = jsonDecode(jsonData);
      return obj['ip'];
    } catch (e) {
      print(e);
      return '';
    }
  }
}*/
