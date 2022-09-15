import 'package:flutter/material.dart';

class TodoItem {
  String message;

  TodoItem({required this.message});
}

class MyState extends ChangeNotifier {
  final List<TodoItem> _list = [];

  List<TodoItem> get list => _list;

  void addItem(TodoItem item) {
    _list.add(item);
    notifyListeners();
  }

  void removeItem(TodoItem item) {
    _list.remove(item);
    notifyListeners();
  }
}
