import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/list_item.dart';
import 'package:heart_at_time/src/widgets/list_section.dart';

/// [CaretakersListScreen] es una pantalla que muestra una lista de cuidadores.
/// Esta pantalla tiene un diseño visualmente agradable con un encabezado y una lista de elementos.
class CaretakersListScreen extends StatefulWidget {
  const CaretakersListScreen({super.key});

  @override
  State<CaretakersListScreen> createState() => _CaretakersListScreenState();
}

class _CaretakersListScreenState extends State<CaretakersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo y contenido principal
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
                // Encabezado y lista de cuidadores
                Column(
                  children: [
                    Column(
                      children: [
                        const HeartWithIcon(
                          iconName: Icons.list,
                          showIcon: true,
                        ),
                        Text(
                          "Cuidadores",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07),
                        ),
                      ],
                    ),
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
          // Botón de retroceso
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
              ))
        ],
      ),
    );
  }
}
