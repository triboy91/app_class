import 'package:flutter/material.dart';
import 'package:cesunapp/pages/load_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadPage(), // 👈 Carga primero esta pantalla
    );
  }
}
