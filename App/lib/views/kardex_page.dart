import 'package:flutter/material.dart';
import '../models/kardex_model.dart';
import '../widgets/kardex_header.dart';
import '../widgets/kardex_filter.dart';
import '../widgets/kardex_table.dart';
import '../widgets/kardex_promedio.dart';

class KardexPage extends StatefulWidget {
  const KardexPage({Key? key}) : super(key: key);

  @override
  State<KardexPage> createState() => _KardexPageState();
}

class _KardexPageState extends State<KardexPage> {
  String periodo = '2024-1';
  String cuatrimestre = 'CUATRIMESTRE 1';

  List<KardexModel> datos = [
    KardexModel(clave: 'MAT101', nombre: 'Matemáticas I', creditos: 8, tipo: 'Obligatoria', estado: 'Aprobada', calificacion: 9.0),
    KardexModel(clave: 'HIS201', nombre: 'Historia', creditos: 6, tipo: 'Obligatoria', estado: 'Aprobada', calificacion: 8.5),
    KardexModel(clave: 'FIS301', nombre: 'Física I', creditos: 7, tipo: 'Obligatoria', estado: 'Aprobada', calificacion: 9.2),
  ];

  double calcularPromedio() {
    if (datos.isEmpty) return 0.0;
    double suma = datos.fold(0, (prev, element) => prev + element.calificacion);
    return suma / datos.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // fondo blanco
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text(
          'Kardex 📋',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const KardexHeader(
            nombre: 'Brisa Ocampo',
            matricula: '20231234',
            carrera: 'Ing. en Sistemas',
          ),
          KardexFilter(
            periodo: periodo,
            cuatrimestre: cuatrimestre,
            onPeriodoChange: (value) => setState(() => periodo = value),
            onCuatrimestreChange: (value) => setState(() => cuatrimestre = value),
          ),
          KardexTable(datos: datos),
          KardexPromedio(promedio: calcularPromedio()),
        ],
      ),
    );
  }
}
