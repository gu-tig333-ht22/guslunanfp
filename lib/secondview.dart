import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class SecondView extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('TIG169 TODO')),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 50),
            Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        labelText: '  What are you going to do?',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0),
                        )))),
            Container(height: 50),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(
                    context, TodoItem(message: controller.text, done: false));
              },
              icon: const Icon(
                Icons.add,
                size: 30.0,
              ),
              label: const Text('ADD'),
            ),
            Consumer<MyState>(
              builder: (context, state, child) => Text(state.ip),
            ),
          ],
        )));
  }
}
