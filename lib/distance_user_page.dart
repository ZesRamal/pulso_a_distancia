import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_at_time/src/screens/history_screen.dart';
import 'package:heart_at_time/src/screens/mystate_screen.dart';

class DistanceUserPage extends StatefulWidget {
  const DistanceUserPage({super.key});

  @override
  State<DistanceUserPage> createState() => _DistanceUserPageState();
}

class _DistanceUserPageState extends State<DistanceUserPage> {
  int _currentIndex = 0;

  List<Widget> screens = [
    MyStateScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3EBDC6),
        centerTitle: true,
        title: Text(
          "Ricardo Escobar",
          style: TextStyle(color: Color(0xffFFF4EA)),
        ),
        iconTheme: IconThemeData(
          color: Color(0xffFFF4EA), //change your color here
        ),
      ),
      backgroundColor: Color(0xffFFF4EA),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Estado"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off_sharp), label: "Historial"),
        ],
        backgroundColor: Color(0xff3EBDC6),
        selectedItemColor: Color(0xffFFF4EA),
        unselectedItemColor: Color(0xffFFF4EA),
        selectedLabelStyle: GoogleFonts.oxygen(),
        unselectedLabelStyle: GoogleFonts.oxygen(),
        type: BottomNavigationBarType.fixed,
        iconSize: 32,
      ),
    );
  }
}
