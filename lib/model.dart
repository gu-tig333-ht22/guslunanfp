import 'package:flutter/material.dart';
import 'internetfetcher.dart';

class TodoItem {
  String message;
  bool done = false;

  TodoItem({required this.message});
}

class MyState extends ChangeNotifier {
  final List<TodoItem> _list = [];
  String _filterBy = 'All';

  List<TodoItem> get list => _list;
  String get filterBy => _filterBy;

  String _ip = '';
  String get ip => _ip;

  /*String key =
      'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a';
  String url = 'https://todoapp-api.apps.k8s.gu.se';
   var apikey = '739e006e-0612-4134-9c08-f006acd11d8a';
   String path = '/todos';*/

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
}
