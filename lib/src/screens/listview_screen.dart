import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/user_card.dart';

/// [ListViewScreen] es una pantalla que muestra una lista de usuarios con los que se puede interactuar.
/// La pantalla incluye un encabezado, una lista de tarjetas de usuario y un botón flotante para añadir nuevos pacientes.
class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenido principal desplazable
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.1),
                decoration: const BoxDecoration(
                  color: Color(0xffFFF4EA),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Encabezado con íconos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            // Línea decorativa
                            Positioned(
                              top: MediaQuery.of(context).size.width * 0.2,
                              left: MediaQuery.of(context).size.width * 0.15,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 1,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Color(0xff0096D1)))),
                              ),
                            ),
                            // Íconos de corazón
                            const Row(
                              children: [
                                HeartWithIcon(
                                  iconName: Icons.abc,
                                  showIcon: false,
                                ),
                                HeartWithIcon(
                                  iconName: Icons.abc,
                                  showIcon: false,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    // Tarjetas de usuario
                    const DistanceUserCard(),
                    const DistanceUserCard(),
                    const DistanceUserCard(),
                    const DistanceUserCard(),
                    const DistanceUserCard(),
                    const DistanceUserCard(),
                  ],
                ),
              ),
            ),
          ),
          // Botón flotante para añadir nuevo paciente
          Positioned(
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff3EBDC6),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ]),
                child: TextButton(
                  onPressed: () {
                    // Cuadro de diálogo para añadir paciente
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Añadir Paciente"),
                              content: Container(
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Id de Usuario:"),
                                    TextField(),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancelar",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Enviar solicitud",
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            ));
                  },
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder())),
                  child: Icon(
                    Icons.add,
                    color: const Color(0xffFFF4EA),
                    size: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
