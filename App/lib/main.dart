import 'package:cesunapp/pages/load_page.dart';
import 'package:flutter/material.dart';
import 'package:cesunapp/filtro.dart'; // Asegúrate de que 'your_app_name' coincida con el nombre de tu proyecto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kardex App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Aquí puedes ajustar aún más el tema si lo deseas
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Barra de aplicación azul
          foregroundColor: Colors.white, // Texto de la barra de aplicación blanco
        ),
        scaffoldBackgroundColor: Colors.white, // Fondo general blanco
        cardColor: Colors.blue[50], // Fondo de las tarjetas azul muy claro (si usaras Card)
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87), // Texto general oscuro
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blueAccent),
      ),
      home: const KardexScreen(), // Aquí se llama a tu pantalla Kardex
    );
  }
}