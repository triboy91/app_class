import 'package:cesunapp/pages/load_page.dart';
import 'package:flutter/material.dart';
import 'package:cesunapp/Pages/load_page.dart';
import 'Theme/AppTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cesun App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.blue[50],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.blueAccent),
      ),
      home: const LoadPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Indices de navegación
  int _selectedIndex = 0;
  int _careerIndex = 0;
  int _studentLifeIndex = 0;

  // Paginas para cada sección
  static const List<Widget> _pages = <Widget>[
    SizedBox(),
    SizedBox(),
    Center(child: Text('Titulacion', style: TextStyle(fontSize: 24))),
  ];

  static const List<Tab> _careerTabs = [
    Tab(icon: Icon(Icons.schedule), text: 'Horario'),
    Tab(icon: Icon(Icons.grade), text: 'Calificaciones'),
    Tab(icon: Icon(Icons.list_alt), text: 'Kardex'),
  ];

  static const List<Widget> _careerPages = <Widget>[
    Center(child: Text('Horario', style: TextStyle(fontSize: 22))),
    Center(child: Text('Calificaciones', style: TextStyle(fontSize: 22))),
    Center(child: Text('Kardex', style: TextStyle(fontSize: 22))),
  ];

  static const List<Tab> _studentLifeTabs = [
    Tab(icon: Icon(Icons.event), text: 'Servicio Comunitario'),
    Tab(icon: Icon(Icons.group), text: 'Servicio Social'),
    Tab(icon: Icon(Icons.article), text: 'Prácticas Profesionales'),
  ];

  static const List<Widget> _studentLifePages = <Widget>[
    Center(child: Text('Servicio Comunitario', style: TextStyle(fontSize: 22))),
    Center(child: Text('Servicio Social', style: TextStyle(fontSize: 22))),
    Center(
      child: Text('Prácticas Profesionales', style: TextStyle(fontSize: 22)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_selectedIndex == 0) {
      body = DefaultTabController(
        length: _careerTabs.length,
        initialIndex: _careerIndex,
        child: Column(
          children: [
            Container(
              color: Colors.blue[50],
              child: TabBar(
                tabs: _careerTabs,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blue,
                onTap: (index) {
                  setState(() {
                    _careerIndex = index;
                  });
                },
              ),
            ),
            Expanded(child: _careerPages[_careerIndex]),
          ],
        ),
      );
    } else if (_selectedIndex == 1) {
      body = DefaultTabController(
        length: _studentLifeTabs.length,
        initialIndex: _studentLifeIndex,
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[50],
              child: TabBar(
                tabs: _studentLifeTabs,
                labelColor: Colors.blueAccent,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                onTap: (index) {
                  setState(() {
                    _studentLifeIndex = index;
                  });
                },
              ),
            ),
            Expanded(child: _studentLifePages[_studentLifeIndex]),
          ],
        ),
      );
    } else {
      body = _pages[_selectedIndex];
    }

    return Scaffold(
      appBar: AppBar(title: const Text('App CESUN')),
      body: body,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Carrera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Vida estudiantil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Titulación',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
