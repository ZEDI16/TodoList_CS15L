import 'package:flutter/material.dart';
import 'dynamic_widget_page.dart'; // import your stateful widget page

void main() {
  runApp(const MyApp()); // Entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acitivty Tab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DynamicWidgetPage(), // The page with add/remove widgets
    );
  }
}

// I apologize sir, absent ko sa last lesson maoy deli complete akoa code po.