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
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () async {
            var newItem = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondView(TodoItem(message: ''))));
            Provider.of<MyState>(context, listen: false).addItem(newItem);
          },
        )
      ]),
      body: Consumer<MyState>(
          builder: (context, state, child) => TodoList(state.list)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () async {
          var newItem = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondView(TodoItem(message: ''))));
          Provider.of<MyState>(context, listen: false).addItem(newItem);
        },
        tooltip: 'ToDo',
        child: const Icon(Icons.add, size: 50, color: Colors.black),
      ),
    );
  }
}
