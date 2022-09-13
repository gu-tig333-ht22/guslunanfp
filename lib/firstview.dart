import 'package:flutter/material.dart';
import './secondview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  /* void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondView()));
          },
        )
      ]),
      body: _todoitem(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondView()));
        }, //_incrementCounter,
        tooltip: 'ToDo',
        child: const Icon(Icons.add, size: 50, color: Colors.white),
      ),
    );
  }
}

Widget _todoitem() {
  return ListTile(
    leading: Checkbox(value: false, onChanged: (val) {}),
    title: const Text('Heeej'),
    trailing: OutlinedButton(
      onPressed: () {},
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
