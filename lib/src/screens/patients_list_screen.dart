import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/list_item.dart';
import 'package:heart_at_time/src/widgets/list_section.dart';

/// [PatientsListScreen] es una pantalla que muestra una lista de pacientes.
/// Utiliza varios widgets personalizados para crear la interfaz.
class PatientsListScreen extends StatelessWidget {
  const PatientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenedor principal con el fondo y la disposición general de la pantalla.
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04),
            decoration: const BoxDecoration(
              color: Color(0xffFFF4EA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        // Widget personalizado que muestra un icono de corazón con un icono específico.
                        const HeartWithIcon(
                          iconName: Icons.list,
                          showIcon: true,
                        ),
                        Text(
                          "Pacientes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07),
                        ),
                      ],
                    ),
                    // Sección que contiene la lista de elementos.
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.04),
                      child: const ListSection(
                        children: [
                          ListItem(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Botón para volver a la pantalla anterior.
          Positioned(
            left: MediaQuery.of(context).size.width * 0.02,
            top: MediaQuery.of(context).size.width * 0.07,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(CircleBorder())),
              child: Icon(
                Icons.arrow_back,
                color: const Color(0xff0096D1),
                size: MediaQuery.of(context).size.width * 0.14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
