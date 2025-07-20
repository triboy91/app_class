// Dart
import 'package:cesunapp/pages/servicios/servicio_screen_menu.dart';
import 'package:flutter/material.dart';
import 'kardex/kardex_screen.dart';
import 'titulacion/titulacion_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú Principal')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Kardex del Estudiante'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => KardexScreen())),
          ),
          ListTile(
            title: Text('Métodos de Titulación'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => TitulacionScreen())),
          ),
          ListTile(
            title: Text('Servicio Comunitario, Social y Prácticas'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => ServiciosMenuScreen())),
          ),
        ],
      ),
    );
  }
}