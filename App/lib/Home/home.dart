import 'package:flutter/material.dart';

// Importaciones de los archivos de tu carpeta /theme
import '../theme/AppColors.dart';
import '../theme/AppTextStyles.dart';
import '../theme/AppButtonStyles.dart';
import '../theme/AppCardStyles.dart';
import '../theme/AppShadows.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 4,
        shadowColor: AppShadows.appBarShadow.color,
        title: const Text(
          'Inicio',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal con sombra
            Text(
              'Bienvenido Alejandro 👋',
              style: AppTextStyles.kardexTitle,
            ),
            const SizedBox(height: 10),

            // Subtítulo o descripción
            Text(
              'Explora tu información académica fácilmente.',
              style: AppTextStyles.kardexSubtitle,
            ),
            const SizedBox(height: 20),

            // Card informativa
            Container(
              decoration: AppCardStyles.cardDecoration.copyWith(
                boxShadow: [AppShadows.cardShadow],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Última actividad:', style: AppTextStyles.subjectName),
                  const SizedBox(height: 8),
                  Text(
                    'Revisaste tu historial académico el 13/07/2025.',
                    style: AppTextStyles.gradeText,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Botón con estilo de cierre de sesión
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para cerrar sesión
                },
                style: AppButtonStyles.logoutButton,
                child: const Text(
                  'Cerrar sesión',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
