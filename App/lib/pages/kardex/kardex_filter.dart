// dart
import 'package:flutter/material.dart';

class KardexFilter extends StatelessWidget {
  final List<String> periods;
  final String? selectedPeriod;
  final ValueChanged<String?> onChanged;

  const KardexFilter({
    super.key,
    required this.periods,
    required this.selectedPeriod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text('Agrupar por:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Año-Cuatrimestre',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
              value: selectedPeriod,
              items: periods.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.black87)),
                );
              }).toList(),
              onChanged: onChanged,
              hint: const Text('--TODOS--', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}