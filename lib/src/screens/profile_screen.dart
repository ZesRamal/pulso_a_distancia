import 'package:flutter/material.dart';
import 'package:heart_at_time/src/screens/caretaker_list_screen.dart';
import 'package:heart_at_time/src/screens/device_status_screen.dart';
import 'package:heart_at_time/src/screens/edit_profile_screen.dart';
import 'package:heart_at_time/src/screens/patients_list_screen.dart';
import 'package:heart_at_time/src/screens/requests_list_screen.dart';
import 'package:heart_at_time/src/widgets/bar_button.dart';
import 'package:heart_at_time/src/widgets/bar_button_section.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';

/// [ProfileScreen] es una pantalla que muestra la información del perfil del usuario
/// y proporciona varias opciones de navegación a través de la aplicación.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04),
            decoration: const BoxDecoration(
              color: Color(0xffFFF4EA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const HeartWithIcon(
                  iconName: Icons.person,
                  showIcon: true,
                ),
                Text(
                  "John Smith",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.07),
                ),
                const Text("Id Usuario: 00000000"),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.15),
                        child: Text("Perfil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04)),
                      ),
                      // Sección de botones para opciones del perfil.
                      const BarButtonSection(
                        children: [
                          OptionBarButton(
                            text: "Editar Perfil",
                            pushTo: ProfileEditScreen(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: Text("Monitoreo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    // Sección de botones para opciones de monitoreo.
                    const BarButtonSection(
                      children: [
                        OptionBarButton(
                          text: "Lista de Cuidadores",
                          pushTo: CaretakersListScreen(),
                        ),
                        OptionBarButton(
                          text: "Lista de Pacientes",
                          pushTo: PatientsListScreen(),
                        ),
                        OptionBarButton(
                          text: "Solicitudes Pendientes",
                          pushTo: RequestListScreen(),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: Text("Dispositivo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    // Sección de botones para opciones del dispositivo.
                    const BarButtonSection(
                      children: [
                        OptionBarButton(
                          text: "Estado de la banda",
                          pushTo: DeviceStatusScreen(),
                        )
                      ],
                    ),
                  ],
                ),
                const LogOutButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// [LogOutButton] es un botón personalizado para cerrar sesión.
class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Color(0xffFDA5A0)),
            fixedSize: MaterialStatePropertyAll(Size(
                MediaQuery.of(context).size.width * 0.7,
                MediaQuery.of(context).size.height * 0.07)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 255, 113, 105), width: 3)))),
        child: Text(
          "Cerrar Sesión",
          style: TextStyle(
              color: const Color(0xffFFF4EA),
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.w100),
        ));
  }
}
