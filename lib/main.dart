import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo List',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
        title: ('TIG169 TODO'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          },
        )
      ]),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: _incrementCounter,
        tooltip: 'ToDo',
        child: const Icon(Icons.add, size: 50, color: Colors.white),
      ),
    );
  }
}

Widget _checkbox() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {},
      ),
      const Text('Tidy room',
          style: TextStyle(decoration: TextDecoration.lineThrough)),
      OutlinedButton(
        onPressed: () {},
        child: Icon(
          Icons.close,
          color: Colors.black,
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    ],
  );
}

Widget _checkboxone() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {},
      ),
      const Text(
        'Tidy room',
      ),
      OutlinedButton(
        onPressed: () {},
        child: Icon(
          Icons.close,
          color: Colors.black,
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    ],
  );
}

Widget _list() {
  var list = [
    'Write a book',
    'Do homework',
    'Tidy room',
    'Watch TV',
    'Nap',
    'Shop groceries',
    'Have fun',
    'Meditate'
  ];

  return ListView(
    children: list.map((item) => _item(item)).toList(),
  );
}

Widget _item(text) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(text, style: TextStyle(fontSize: 18)),
  );
}

Widget _insertTaskField() {
  return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
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
        primary: Colors.grey, // background
        onPrimary: Colors.black, // foreground
      ),
      icon: Icon(
        // <-- Icon
        Icons.add,
        size: 30.0,
      ),
      label: Text('ADD'), // <-- Text
    ),
  ]);
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TIG169 TODO'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 50),
            Container(height: 100, child: _insertTaskField()),
            _addtext(),
          ],
        )));
  }
}
