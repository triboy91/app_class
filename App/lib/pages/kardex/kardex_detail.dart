// dart
import 'package:flutter/material.dart';
import 'kardex_model.dart';

class KardexDetail extends StatelessWidget {
  final Map<String, List<Kardex>> periodGroups;
  final double overallAverage;
  final double Function(List<Kardex>) calculateAverage;

  const KardexDetail({
    super.key,
    required this.periodGroups,
    required this.overallAverage,
    required this.calculateAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: periodGroups.isEmpty
              ? const Center(child: Text('No hay datos disponibles para el período seleccionado.'))
              : SingleChildScrollView(
            child: Column(
              children: periodGroups.entries.map((entry) {
                final period = entry.key;
                final kardexList = entry.value;
                final periodAverage = calculateAverage(kardexList);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      color: Colors.blue[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Periodo: $period',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                          ),
                          Text(
                            'Promedio: ${periodAverage.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                                (_) => Colors.blue[200]),
                        dataRowColor: MaterialStateProperty.resolveWith<Color?>(
                                (_) => Colors.white),
                        border: TableBorder.all(color: Colors.blue.withOpacity(0.2), width: 1.0),
                        columnSpacing: 20,
                        horizontalMargin: 16,
                        columns: const <DataColumn>[
                          DataColumn(label: Expanded(child: Text('Clave', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Nombre de Asignatura', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Grado (Plan)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Créditos', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Curso', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Grado (Cursado)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Calificación', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Tipo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                          DataColumn(label: Expanded(child: Text('Es...', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))),
                        ],
                        rows: kardexList.map((kardex) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(Text(kardex.id)),
                              DataCell(Text(kardex.subjectName)),
                              DataCell(Text(kardex.planGrade)),
                              DataCell(Text(kardex.credits.toString())),
                              DataCell(Text(kardex.course)),
                              DataCell(Text(kardex.currentGrade)),
                              DataCell(Text(kardex.qualification)),
                              DataCell(Text(kardex.type)),
                              DataCell(Text(kardex.es)),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Promedio General:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue)),
              const SizedBox(width: 10),
              Text(overallAverage.toStringAsFixed(2), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }
}