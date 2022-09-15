import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> list;

  const TodoList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((item) => _listItem(context, item)).toList());
  }

  Widget _listItem(context, item) {
    return ListTile(
      leading: Checkbox(value: false, onChanged: (val) {}),
      title: Text(item.message),
      trailing: OutlinedButton(
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeItem(item);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        child: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    );
  }
}
