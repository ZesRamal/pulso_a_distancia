import 'package:flutter/material.dart';
import 'package:heart_at_time/home_page.dart';
import 'package:heart_at_time/src/screens/signup_screen.dart';
import 'package:heart_at_time/src/widgets/iconTitle.dart';
import 'package:heart_at_time/src/widgets/inputField.dart';
import 'package:heart_at_time/src/widgets/logInWith.dart';
import 'package:heart_at_time/src/widgets/longButton.dart';
import 'package:heart_at_time/src/widgets/textWithButton.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFF4EA),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconTitle(
                    Icons.favorite,
                    "Inicia Sesión",
                    "Por favor inicia sesión para utilizar la app",
                    iconSize: MediaQuery.of(context).size.width * 0.20,
                    titleSize: MediaQuery.of(context).size.width * 0.09,
                    subtitleSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Column(
                    children: [
                      InputField("Correo", TextInputType.emailAddress),
                      InputField(
                        "Contraseña",
                        TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      LongButton("Iniciar Sesión", () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route route) => false);
                      }),
                      TextWithButton("¿No tienes una cuenta?", "Crea una", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      }),
                    ],
                  ),
                  LogInWith()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
