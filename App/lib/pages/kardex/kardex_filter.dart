// Dart
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class KardexFilter extends StatelessWidget {
  final List<String> periods;
  final String? selectedPeriod;
  final Function(String?) onFilter;

  const KardexFilter({
    Key? key,
    required this.periods,
    required this.selectedPeriod,
    required this.onFilter,
  }) : super(key: key);

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
              decoration: InputDecoration(
                labelText: 'Año-Cuatrimestre',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: AppColors.textBlue),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
              value: selectedPeriod,
              items: periods.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.black87)),
                );
              }).toList(),
              onChanged: onFilter,
              hint: const Text('--TODOS--', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}