import 'package:flutter/material.dart';
import 'package:cesunapp/pages/load_page.dart';
import 'theme/AppTheme.dart';
import 'Home/home.dart';
import 'package:cesunapp/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // ← tema global
      home: LoadPage(),
    );
  }
}