import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Logo de CESUN
            Image.asset('assets/images/cesun_logo.png'),
            // Animación de carga
            Lottie.asset('assets/jsons/loading.json'),
          ],
        ),
      ),
    );
  }
}
