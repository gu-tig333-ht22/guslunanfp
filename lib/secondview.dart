import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TIG169 TODO'),
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
