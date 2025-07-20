// Dart
import 'package:flutter/material.dart';
import 'kardex_model.dart';
import '../../utils/constants.dart';

class KardexDetail extends StatelessWidget {
  final Kardex kardex;

  const KardexDetail({Key? key, required this.kardex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: AppColors.headerBlue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Detalle de la materia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textBlue)),
            const SizedBox(height: 8),
            Text('Clave: ${kardex.id}'),
            Text('Nombre: ${kardex.subjectName}'),
            Text('Periodo: ${kardex.period}'),
            Text('Calificación: ${kardex.qualification}'),
            Text('Créditos: ${kardex.credits}'),
            Text('Tipo: ${kardex.type}'),
          ],
        ),
      ),
    );
  }
}