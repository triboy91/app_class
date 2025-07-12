import 'package:flutter/material.dart';
import '../models/kardex_model.dart';

class KardexTable extends StatelessWidget {
  final List<KardexModel> datos;

  const KardexTable({Key? key, required this.datos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.blue.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(const Color(0xFF1565C0)), // azul vibrante
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          columns: const [
            DataColumn(label: Text('Clave')),
            DataColumn(label: Text('Nombre de Asignatura')),
            DataColumn(label: Text('Créditos')),
            DataColumn(label: Text('Tipo')),
            DataColumn(label: Text('Estado')),
            DataColumn(label: Text('Calificación')),
          ],
          rows: datos.map((dato) {
            return DataRow(cells: [
              DataCell(Text(dato.clave)),
              DataCell(Text(dato.nombre)),
              DataCell(Text('${dato.creditos}')),
              DataCell(Text(dato.tipo)),
              DataCell(Text(dato.estado)),
              DataCell(Text('${dato.calificacion}')),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

