import 'package:flutter/material.dart';
import 'package:todolist5/widgets/NoteWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Todo list")),
        body: NoteWidget(),
        // backgroundColor: const Color.fromARGB(255, 255, 25, 25),
      ),
    );
  }
}
