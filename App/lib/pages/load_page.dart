import 'package:cesunapp/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cesunapp/Pages/student_page.dart'; // 👈 pantalla de perfil

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StudentPage()),
      );
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo de CESUN
              Image.asset(
                'assets/images/cesun_logo.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 32), // Espacio entre logo y animación
              // Animación de carga
              SizedBox(
                width: 150,
                height: 150,
                child: Lottie.asset('assets/jsons/loading.json'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
