import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_at_time/src/screens/history_screen.dart';
import 'package:heart_at_time/src/screens/listview_screen.dart';
import 'package:heart_at_time/src/screens/mystate_screen.dart';
import 'package:heart_at_time/src/screens/profile_screen.dart';

/// La página [HomePage] es la pantalla principal de la aplicación, que muestra diferentes secciones y permite al usuario navegar entre ellas.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const MyStateScreen(),
    const ListViewScreen(),
    const HistoryScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4EA),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Mi Estado"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart_outlined), label: "A Distancia"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off_sharp), label: "Historial"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined), label: "Perfil"),
        ],
        backgroundColor: const Color(0xff3EBDC6),
        selectedItemColor: const Color(0xffFFF4EA),
        unselectedItemColor: const Color(0xffFFF4EA),
        selectedLabelStyle: GoogleFonts.oxygen(),
        unselectedLabelStyle: GoogleFonts.oxygen(),
        type: BottomNavigationBarType.fixed,
        iconSize: 32,
      ),
    );
  }
}
