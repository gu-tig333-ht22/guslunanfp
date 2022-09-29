import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class InternetFetcher {
  var apikey = '739e006e-0612-4134-9c08-f006acd11d8a';

  /*static Future<String> getList() async {
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
  }*/

/*
    Future getList() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'),
    );
    _list = (jsonDecode(response.body));
    notifyListeners();
  }*/

  static Future<List<TodoItem>> addItem(TodoItem item) async {
    Map<String, dynamic> json = TodoItem.toJson(item);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    List<dynamic> listFromApi = jsonDecode(bodyString);
    return listFromApi.map((x) => TodoItem.fromJson(x)).toList();
  }

  static Future<List<TodoItem>> removeItem(id) async {
    http.Response response = await http.delete(
        Uri.parse(
            'https://todoapp-api.apps.k8s.gu.se/todos/$id?key=739e006e-0612-4134-9c08-f006acd11d8a'),
        headers: {'Content-Type': 'application/json'});
    List<dynamic> listFromApi = jsonDecode(response.body);
    return listFromApi.map((x) => TodoItem.fromJson(x)).toList();
  }

  static Future<List<TodoItem>> checkItem(item) async {
    String id = item.id;
    http.Response response = await http.put(
        Uri.parse(
            'https://todoapp-api.apps.k8s.gu.se/todos/$id?key=739e006e-0612-4134-9c08-f006acd11d8a'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': item.message, 'done': item.done}));

    List<dynamic> listFromApi = jsonDecode(response.body);
    return listFromApi.map((x) => TodoItem.fromJson(x)).toList();
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

/*
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
}*/