import 'package:flutter/material.dart';

class KardexFilter extends StatelessWidget {
  final String periodo;
  final String cuatrimestre;
  final ValueChanged<String>? onPeriodoChange;
  final ValueChanged<String>? onCuatrimestreChange;

  const KardexFilter({
    Key? key,
    required this.periodo,
    required this.cuatrimestre,
    this.onPeriodoChange,
    this.onCuatrimestreChange,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filtrar por:',
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
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: periodo,
                    isExpanded: true,
                    iconEnabledColor: Color(0xFF1565C0),
                    decoration: const InputDecoration(
                      labelText: 'Periodo',
                      labelStyle: TextStyle(color: Color(0xFF1565C0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    items: ['2021-1', '2022-1', '2023-2', '2024-1']
                        .map((p) => DropdownMenuItem(
                      value: p,
                      child: Text(p),
                    ))
                        .toList(),
                    onChanged: (value) => onPeriodoChange?.call(value!),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: cuatrimestre,
                    isExpanded: true,
                    iconEnabledColor: Color(0xFF1565C0),
                    decoration: const InputDecoration(
                      labelText: 'Grado (Cursado)',
                      labelStyle: TextStyle(color: Color(0xFF1565C0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    items: [
                      'CUATRIMESTRE 1',
                      'CUATRIMESTRE 2',
                      'CUATRIMESTRE 3',
                      'CUATRIMESTRE 4',
                      'CUATRIMESTRE 5',
                      'CUATRIMESTRE 6',
                      'CUATRIMESTRE 7',
                      'CUATRIMESTRE 8',
                      'CUATRIMESTRE 9',
                    ]
                        .map((g) => DropdownMenuItem(
                      value: g,
                      child: Text(g),
                    ))
                        .toList(),
                    onChanged: (value) => onCuatrimestreChange?.call(value!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
