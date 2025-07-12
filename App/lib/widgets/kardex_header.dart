import 'package:flutter/material.dart';

class KardexHeader extends StatelessWidget {
  final String matricula;
  final String nombre;
  final String carrera;

  const KardexHeader({
    Key? key,
    required this.matricula,
    required this.nombre,
    required this.carrera,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.blue.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Datos del Alumno',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0), // azul vibrante
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(1, 1),
                    blurRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Matrícula: $matricula',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Nombre: $nombre',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
