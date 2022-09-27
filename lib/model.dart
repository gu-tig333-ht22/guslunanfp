import 'dart:convert';

import 'package:flutter/material.dart';
import 'internetfetcher.dart';
import 'package:http/http.dart' as http;

class TodoItem {
  var _id;
  String message;
  bool _done = false;

  TodoItem({required this.message, required id, required done}) {
    this.message = name;
    this._done = done;
    this._id = id;
  }

  String get name => message;
  bool get done => _done;
  String get id => _id;

  set name(String newName) {
    message = newName;
  }
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = 'All';

  List<TodoItem> get list => _list;
  String get filterBy => _filterBy;

  String _ip = '';
  String get ip => _ip;

  String key =
      'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a';
  String url = 'https://todoapp-api.apps.k8s.gu.se';
  var apikey = '739e006e-0612-4134-9c08-f006acd11d8a';
  String path = '/todos';

//HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEJ
  void fetchIp() async {
    var ip = await InternetFetcher.fetchIp();

    _ip = ip;
    notifyListeners();
  }

  void addItem(TodoItem item) {
    _list.add(item);
    notifyListeners();
  }

  void removeItem(TodoItem item) {
    _list.remove(item);
    notifyListeners();
  }

  void setFilterBy(filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void checkItem(item) {
    item.done = !item.done;
    notifyListeners();
  }
/*
  List<TodoItem> createList(ObjData) {
    List<TodoItem> newList = [];
    ObjData.forEach((item) {
      newList.add(TodoItem(
        message: item["title"],
        id: item["id"],
        done: item["done"],
      ));
    });
    return newList;
  }*/
}
