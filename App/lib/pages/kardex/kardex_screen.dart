// dart
import 'package:flutter/material.dart';
import 'kardex_model.dart';
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

  String? _selectedPeriod;

  List<String> get _uniquePeriods {
    final periods = _allKardex.map((t) => t.period).toSet().toList();
    periods.sort();
    return ['--TODOS--', ...periods];
  }

  void _applyFilter(String? period) {
    setState(() {
      _selectedPeriod = period;
    });
  }

  double _calculateAverage(List<Kardex> kardexList) {
    if (kardexList.isEmpty) return 0.0;
    double total = 0;
    int count = 0;
    for (var k in kardexList) {
      try {
        total += double.parse(k.qualification);
        count++;
      } catch (_) {}
    }
    return count > 0 ? total / count : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    List<Kardex> filteredKardex;
    if (_selectedPeriod == null || _selectedPeriod == '--TODOS--') {
      filteredKardex = _allKardex;
    } else {
      filteredKardex = _allKardex.where((k) => k.period == _selectedPeriod).toList();
    }

    Map<String, List<Kardex>> periodGroups = {};
    for (var k in filteredKardex) {
      periodGroups.putIfAbsent(k.period, () => []).add(k);
    }

    double overallAverage = _calculateAverage(filteredKardex);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expediente del Alumno'),
      ),
      body: Column(
        children: [
          KardexFilter(
            periods: _uniquePeriods,
            selectedPeriod: _selectedPeriod,
            onChanged: _applyFilter,
          ),
          Expanded(
            child: KardexDetail(
              periodGroups: periodGroups,
              overallAverage: overallAverage,
              calculateAverage: _calculateAverage,
            ),
          ),
        ],
      ),
    );
  }
}