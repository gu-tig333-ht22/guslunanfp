import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './firstview.dart';

void main() {
  var state = MyState();
  state.getList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo List',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
        title: ('TIG169 TODO'),
      ),
    );
  }
}
