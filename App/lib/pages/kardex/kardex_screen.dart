// Dart
import 'package:flutter/material.dart';
import 'kardex_model.dart';
import '../../utils/constants.dart';
import 'kardex_filter.dart';
import 'kardex_detail.dart';

class KardexScreen extends StatefulWidget {
  const KardexScreen({super.key});

  @override
  State<KardexScreen> createState() => _KardexScreenState();
}

class _KardexScreenState extends State<KardexScreen> {
  final List<Kardex> _allKardex = [
    Kardex(id: 'ING001', subjectName: 'Matemáticas I', planGrade: '1er Semestre', period: '2024-1', credits: 6, course: 'Regular', currentGrade: '1er Semestre', qualification: '9.0', type: 'Ordinaria', es: ''),
    Kardex(id: 'FIS002', subjectName: 'Física General', planGrade: '1er Semestre', period: '2024-1', credits: 6, course: 'Regular', currentGrade: '1er Semestre', qualification: '8.5', type: 'Ordinaria', es: ''),
    Kardex(id: 'PRG003', subjectName: 'Programación Básica', planGrade: '2do Semestre', period: '2024-2', credits: 7, course: 'Regular', currentGrade: '2do Semestre', qualification: '9.5', type: 'Ordinaria', es: ''),
    Kardex(id: 'CAL004', subjectName: 'Cálculo Diferencial', planGrade: '2do Semestre', period: '2024-2', credits: 6, course: 'Regular', currentGrade: '2do Semestre', qualification: '7.8', type: 'Ordinaria', es: ''),
    Kardex(id: 'ALG005', subjectName: 'Álgebra Lineal', planGrade: '3er Cuatrimestre', period: '2025-1', credits: 6, course: 'Regular', currentGrade: '3er Cuatrimestre', qualification: '9.2', type: 'Ordinaria', es: ''),
    Kardex(id: 'RED006', subjectName: 'Redes de Computadoras', planGrade: '3er Cuatrimestre', period: '2025-1', credits: 5, course: 'Regular', currentGrade: '3er Cuatrimestre', qualification: '8.0', type: 'Ordinaria', es: ''),
    Kardex(id: 'DBA007', subjectName: 'Bases de Datos', planGrade: '4to Cuatrimestre', period: '2025-2', credits: 7, course: 'Regular', currentGrade: '4to Cuatrimestre', qualification: '8.9', type: 'Ordinaria', es: ''),
    Kardex(id: 'SOF008', subjectName: 'Ingeniería de Software', planGrade: '4to Cuatrimestre', period: '2025-2', credits: 6, course: 'Regular', currentGrade: '4to Cuatrimestre', qualification: '9.1', type: 'Ordinaria', es: ''),
  ];

  List<Kardex> _filteredKardex = [];
  String? _selectedPeriod;
  Kardex? _selectedKardex;

  List<String> get _uniquePeriods {
    final periods = _allKardex.map((t) => t.period).toSet().toList();
    periods.sort();
    return ['--TODOS--', ...periods];
  }

  void _applyFilter(String? period) {
    setState(() {
      _selectedPeriod = period;
      if (_selectedPeriod == null || _selectedPeriod == '--TODOS--') {
        _filteredKardex = _allKardex;
      } else {
        _filteredKardex = _allKardex.where((k) => k.period == _selectedPeriod).toList();
      }
      _selectedKardex = null;
    });
  }

  double _calculateOverallAverage() {
    if (_filteredKardex.isEmpty) return 0.0;
    double total = 0;
    int count = 0;
    for (var k in _filteredKardex) {
      try {
        total += double.parse(k.qualification);
        count++;
      } catch (_) {}
    }
    return count > 0 ? total / count : 0.0;
  }

  @override
  void initState() {
    super.initState();
    _filteredKardex = _allKardex;
  }

  @override
  Widget build(BuildContext context) {
    final overallAverage = _calculateOverallAverage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expediente del Alumno'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          KardexFilter(
            periods: _uniquePeriods,
            selectedPeriod: _selectedPeriod,
            onFilter: _applyFilter,
          ),
          Expanded(
            child: _filteredKardex.isEmpty
                ? Center(child: Text('No hay datos disponibles para el período seleccionado.'))
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                        (_) => AppColors.headerBlue),
                dataRowColor: MaterialStateProperty.resolveWith<Color?>(
                        (_) => Colors.white),
                border: TableBorder.all(color: AppColors.primaryBlue.withOpacity(0.2), width: 1.0),
                columnSpacing: 20,
                horizontalMargin: 16,
                columns: const <DataColumn>[
                  DataColumn(label: Expanded(child: Text('Clave', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Nombre de Asignatura', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Grado (Plan)', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Periodo', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Créditos', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Curso', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Grado (Cursado)', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Calificación', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Tipo', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                  DataColumn(label: Expanded(child: Text('Es...', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlue)))),
                ],
                rows: _filteredKardex.map((kardex) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(kardex.id), onTap: () {
                        setState(() {
                          _selectedKardex = kardex;
                        });
                      }),
                      DataCell(Text(kardex.subjectName)),
                      DataCell(Text(kardex.planGrade)),
                      DataCell(Text(kardex.period)),
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Promedio General:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textBlue)),
                const SizedBox(width: 10),
                Text(overallAverage.toStringAsFixed(2), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
          if (_selectedKardex != null)
            KardexDetail(kardex: _selectedKardex!),
        ],
      ),
    );
  }
}