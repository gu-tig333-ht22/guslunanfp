import 'package:flutter/material.dart';
import './model.dart';

class ThirdView extends StatelessWidget {
  final TodoItem item;

  const ThirdView(this.item, {super.key});
  //const SecondView(TodoItem todoItem, {super.key});

  //@override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('EXTRASIDA'),
          actions: [
            TextButton(
              child: const Text('ADD', style: TextStyle(color: Colors.black)),
              onPressed: () {},
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 50),
            SizedBox(height: 100, child: _insertTaskField()),
            _addtext(),
          ],
        )));
  }
}

Widget _insertTaskField() {
  return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'What are you going to do?',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
          ),
        ),
      ));
}

Widget _addtext() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
      ),
      icon: const Icon(
        Icons.add,
        size: 30.0,
      ),
      label: const Text('ADD'),
    ),
  ]);
}
