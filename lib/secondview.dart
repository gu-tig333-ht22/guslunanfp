import 'package:flutter/material.dart';
import './model.dart';

class SecondView extends StatefulWidget {
  final TodoItem item;

  const SecondView(this.item, {super.key});

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(item);
  }
}

class SecondViewState extends State<SecondView> {
  late String message;

  late TextEditingController textEditingController;

  SecondViewState(TodoItem item) {
    this.message = item.message;

    textEditingController = TextEditingController(text: item.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TIG169 TODO'),
          /*actions: [
            TextButton(
              child: const Text('ADD', style: TextStyle(color: Colors.black)),
              onPressed: () {
                //Navigator.pop(context, TodoItem(message: message));
              },
            )
          ]*/
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 50),
            Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    )))),
            Container(height: 50),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, TodoItem(message: message));
              },
              icon: const Icon(
                Icons.add,
                size: 30.0,
              ),
              label: const Text('ADD'),
            )
          ],
        )));
  }
}
