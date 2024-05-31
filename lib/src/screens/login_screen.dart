import 'package:flutter/material.dart';
import 'package:heart_at_time/src/screens/signup_screen.dart';
import 'package:heart_at_time/src/widgets/iconTitle.dart';
import 'package:heart_at_time/src/widgets/inputField.dart';
import 'package:heart_at_time/src/widgets/logInWith.dart';
import 'package:heart_at_time/src/widgets/longButton.dart';
import 'package:heart_at_time/src/widgets/textWithButton.dart';

/// [LogInScreen] es una pantalla que permite a los usuarios iniciar sesión en la aplicación.
/// La pantalla incluye campos de entrada para el correo electrónico y la contraseña,
/// botones para iniciar sesión, crear una cuenta y opciones para iniciar sesión con otros servicios.
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
                  // Título de la pantalla con ícono
                  IconTitle(
                    Icons.favorite,
                    "Inicia Sesión",
                    "Por favor inicia sesión para utilizar la app",
                    iconSize: MediaQuery.of(context).size.width * 0.20,
                    titleSize: MediaQuery.of(context).size.width * 0.09,
                    subtitleSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                  // Campos de entrada para el correo y la contraseña
                  const Column(
                    children: [
                      InputField("Correo", TextInputType.emailAddress),
                      InputField(
                        "Contraseña",
                        TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ],
                  ),
                  // Botón de iniciar sesión y enlace para crear una cuenta nueva
                  Column(
                    children: [
                      LongButton("Iniciar Sesión", () {}),
                      TextWithButton("¿No tienes una cuenta?", "Crea una", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      }),
                    ],
                  ),
                  // Opciones para iniciar sesión con otros servicios
                  const LogInWith()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
