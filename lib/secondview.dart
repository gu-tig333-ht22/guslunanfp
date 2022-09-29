import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import 'package:http/http.dart' as http;

class SecondView extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  /* String message;
  TextEditingController textEditingController;

  SecondViewState(TodoItem item) {
    message = item.message;

    textEditingController = TextEditingController(text: item.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  @override*/
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
            _content(context), //TILLFÄLLIG KNAPP
            Consumer<MyState>(
              builder: (context, state, child) => Text(state.ip),
            ), //TESTING!
          ],
        )));
  }

/*class SecondView extends StatefulWidget {
  TodoItem item;

  SecondView(this.item, {super.key});

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(item);
  }
}

class SecondViewState extends State<SecondView> {
  String message;
  TextEditingController textEditingController;

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
                http.post(Uri.parse(
                    'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'));
                Navigator.pop(
                    context, TodoItem(message: message, done: false));
              },
              icon: const Icon(
                Icons.add,
                size: 30.0,
              ),
              label: const Text('ADD'),
            ),
            _content(context),//TILLFÄLLIG KNAPP
            Consumer<MyState>(
              builder: (context, state, child) => Text(state.ip),
            ), //TESTING!
          ],
        )));
  }*/
  //KOOOOOOOOOOOOOOOOOOOLLA HÄÄÄÄÄÄÄÄÄÄR

//DESSA TRE ÄR TILLFÄLLIG KOD TILLHÖRANDE KLICK!-KNAPPEN FÖR ATT KUNNA SE VILKA TODOS SOM FINNS I LISTAN
  Widget _content(context) {
    return Column(
      children: [
        const Text('ip'),
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
    /*var state = Provider.of<MyState>(context, listen: false);
    state.fetchIp();*/
    var state = await fetchIp();
    print(state);
  }

  static Future<String> fetchIp() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=739e006e-0612-4134-9c08-f006acd11d8a'));
      var jsonData = response.body;
      var obj = jsonDecode(jsonData);
      print(response.body);
      return obj['id'];
    } catch (e) {
      print(e);
      return '';
    }
  }
}
