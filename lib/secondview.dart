import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    message = item.message;

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
                    controller: textEditingController,
                    decoration: const InputDecoration(
                        labelText: '  What are you going to do?',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0),
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
            ),
            _content(context),
            Consumer<MyState>(
              builder: (context, state, child) => Text(state.ip),
            ), //TESTING!
          ],
        )));
  }

//TESTIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIING
  Widget _content(context) {
    return Column(
      children: [
        Text('ip'),
        ElevatedButton(
          child: const Text('Klick!'),
          onPressed: () {
            _doStuff(context);
          },
        ),
      ],
    );
  }

  void _doStuff(context) async {
    var state = Provider.of<MyState>(context, listen: false);
    state.fetchIp();
  }
}

class InternetFetcher {
  static Future<String> fetchIp() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://api.myip.com/'));
      var jsonData = response.body;
      var obj = jsonDecode(jsonData);
      return obj['ip'];
    } catch (e) {
      print(e);
      return '';
    }
  }
}
