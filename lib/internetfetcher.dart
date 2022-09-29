import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class InternetFetcher {
  var apikey = '739e006e-0612-4134-9c08-f006acd11d8a';

  static Future<List<TodoItem>> getList() async {
    var response = await http.get(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'),
    );
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
  }

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
