import 'package:flutter/material.dart';
import 'internetfetcher.dart';

class TodoItem {
  String id;
  String message;
  bool done;

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

  final String _ip = '';
  String get ip => _ip;

  MyState() {
    getList();
  }

  Future getList() async {
    List<TodoItem> list = await InternetFetcher.getList();
    _list = list;
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
