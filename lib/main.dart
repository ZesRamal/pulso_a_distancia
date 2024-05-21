import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_at_time/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Heart at Time",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Color(0xff0096D1),
              selectionColor: Colors.blueGrey[50],
              selectionHandleColor: Color(0xff0096D1)),
          textTheme: GoogleFonts.oxygenTextTheme(Theme.of(context).textTheme)),
      home: HomePage(),
    );
  }
}
