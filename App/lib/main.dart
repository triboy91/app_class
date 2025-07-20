// Dart
import 'package:flutter/material.dart';
import 'pages/load_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad App',
      home: LoadPage(),
    );
  }
}