import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/bar_button_section.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';
import 'package:heart_at_time/src/widgets/patient_request_list_item.dart';
import 'package:heart_at_time/src/widgets/request_list_item.dart';

/// [RequestListScreen] es una pantalla que muestra la lista de solicitudes de cuidadores y pacientes.
class RequestListScreen extends StatelessWidget {
  const RequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                        const HeartWithIcon(
                          iconName: Icons.person_add,
                          showIcon: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.07),
                          child: Text(
                            "Solicitudes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                          child: Text("Cuidadores",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                        ),
                        // Sección de botones para las solicitudes de cuidadores.
                        const BarButtonSection(
                          children: [RequestListItem()],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                          child: Text("Pacientes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                        ),
                        // Sección de botones para las solicitudes de pacientes.
                        const BarButtonSection(
                          children: [PatientRequestListItem()],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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
