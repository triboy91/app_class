import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Educativa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1565C0), // Azul vibrante
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    KardexScreen(),
    LogoutScreen(),
  ];

  static const List<String> _titles = [
    'Inicio',
    'Kardex',
    'Cerrar sesión',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Color primaryBlue = const Color(0xFF1565C0); // Azul vibrante

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: primaryBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              backgroundColor: primaryBlue,
              icon: const Text('🏠', style: TextStyle(fontSize: 28)),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              backgroundColor: primaryBlue,
              icon: const Text('📋', style: TextStyle(fontSize: 28)),
              label: 'Kardex',
            ),
            BottomNavigationBarItem(
              backgroundColor: primaryBlue,
              icon: const Text('🔒', style: TextStyle(fontSize: 28)),
              label: 'Salir',
            ),

          ],
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                blurRadius: 2,
              )
            ],
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                blurRadius: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final Color primaryBlue = const Color(0xFF1565C0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),

      child: Stack(
        children: [
          // Animación en la parte superior derecha
          Positioned(
            top: -10,
            right: 0,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Lottie.asset('assets/animations/school.json'),
            ),
          ),
        ],
      ),
    );
  }
}

class KardexScreen extends StatelessWidget {
  const KardexScreen({super.key});

  final Color primaryBlue = const Color(0xFF1565C0);

  // Datos simulados de materias y calificaciones
  final List<Map<String, String>> materias = const [
    {"nombre": "Matemáticas", "calificacion": "95"},
    {"nombre": "Física", "calificacion": "88"},
    {"nombre": "Química", "calificacion": "92"},
    {"nombre": "Historia", "calificacion": "85"},
    {"nombre": "Literatura", "calificacion": "90"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título principal
          Text(
            'Historial Académico',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: primaryBlue,
              shadows: [
                Shadow(
                  color: Colors.blue.shade100,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Subtítulo o descripción
          Text(
            'A continuación, se muestran tus materias y calificaciones:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 24),

          // Lista de materias con calificaciones
          ...materias.map((materia) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.school, color: primaryBlue),
                title: Text(
                  materia["nombre"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: primaryBlue,
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: Text(
                    materia["calificacion"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryBlue,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),

          const SizedBox(height: 40),

          // Pie de página o nota
          Center(
            child: Text(
              '¡Sigue esforzándote para mejorar cada día!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: primaryBlue.withOpacity(0.7),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  final Color primaryBlue = const Color(0xFF1565C0);

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Cerrar sesión?'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar sesión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sesión cerrada')),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animación
            SizedBox(
              height: 180,
              child: Lottie.asset('assets/animations/school.json'),
            ),

            const SizedBox(height: 30),

            // Texto llamativo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                SizedBox(width: 8),
                Text(
                  '¿Estás seguro que quieres salir?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Botón para confirmar cierre
            ElevatedButton.icon(
              onPressed: () => _confirmLogout(context),
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Cerrar sesión'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Botón para cancelar
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Has decidido continuar en la app')),
                );
              },
              child: const Text('Cancelar y volver'),
            ),
          ],
        ),
      ),
    );
  }
}

