import 'dart:collection';

import 'package:flutter/material.dart';
import 'internetfetcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoItem {
  String id;
  String message;
  bool done; // = false;

  TodoItem({required this.message, this.done = false, this.id = ''});

  static Map<String, dynamic> toJson(TodoItem item) {
    return {
      'title': item.message,
      'done': item.done,
    };
  }

  static TodoItem fromJson(dynamic item) {
    return TodoItem(message: item['title'], done: item['done'], id: item['id']);
  }
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = 'All';

  List<TodoItem> get list => _list;

  String get filterBy => _filterBy;

  String _ip = '';
  String get ip => _ip;

  MyState() {
    getList();
  }
/*
    Future fetchList() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'),
    );
    _list = (jsonDecode(response.body));
    notifyListeners();
  }*/

  static Future<String> fetchIp(item) async {
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

//get listan
  /*void getList(TodoItem item) async {
    _list = (await InternetFetcher.getList()) as List<TodoItem>;
    notifyListeners();
  }*/

  Future getList() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'),
    );
    _list = (jsonDecode(response.body));
    notifyListeners();
  }

  void addItem(TodoItem item) async {
    _list = await InternetFetcher.addItem(item);
    notifyListeners();
  }

  void removeItem(item) async {
    _list = await InternetFetcher.removeItem(item.id);
    notifyListeners();
  }

  void setFilterBy(filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void checkItem(item) async {
    item.done = !item.done;
    _list = await InternetFetcher.checkItem(item);
    notifyListeners();
  }
}
