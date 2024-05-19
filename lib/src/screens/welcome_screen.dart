import 'package:flutter/material.dart';
import 'package:heart_at_time/src/screens/login_screen.dart';
import 'package:heart_at_time/src/screens/signup_screen.dart';
import 'package:heart_at_time/src/widgets/iconTitle.dart';
import 'package:heart_at_time/src/widgets/longButton.dart';
import 'package:heart_at_time/src/widgets/textWithButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4EA),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTitle(Icons.favorite, "¡Bienvenido!",
                  "Crea una cuenta o inicia sesión para comenzar.",
                  iconSize: MediaQuery.of(context).size.width * 0.35,
                  titleSize: MediaQuery.of(context).size.width * 0.1,
                  subtitleSize: MediaQuery.of(context).size.width * 0.04),
              Column(
                children: [
                  LongButton("Empezar", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  }),
                  TextWithButton("¿Tienes una cuenta?", "Inicia Sesión", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInScreen()),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
