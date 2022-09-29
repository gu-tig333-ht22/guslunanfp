import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todolist.dart';
import './model.dart';
import './secondview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Samma som CardsListView
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.title)), actions: [
        PopupMenuButton(
            onSelected: (value) {
              Provider.of<MyState>(context, listen: false).setFilterBy(value);
            },
            itemBuilder: (context) => [
                  const PopupMenuItem(value: 'All', child: Text('All')),
                  const PopupMenuItem(value: 'Undone', child: Text('Undone')),
                  const PopupMenuItem(value: 'Done', child: Text('Done')),
                ]),
      ]),
      body: Consumer<MyState>(
          builder: (context, state, child) =>
              TodoList(_filterList(state.list, state.filterBy))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () async {
          var newItem = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
          if (newItem != null) {
            //ny rad jag lagt till

            //TodoItem(message: '', done: false, id: null))));
            Provider.of<MyState>(context, listen: false).addItem(newItem);
          }
        },
        tooltip: 'ToDo',
        child: const Icon(Icons.add, size: 50, color: Colors.black),
      ),
    );
  }
}

List<TodoItem> _filterList(list, filterBy) {
  if (filterBy == 'all') return list;
  if (filterBy == 'Done') {
    return list.where((item) => item.done == true).toList();
  }
  if (filterBy == 'Undone') {
    return list.where((item) => item.done == false).toList();
  }
  return list;
}
