import 'package:flutter/material.dart';
import 'package:heart_at_time/src/widgets/bar_button_section.dart';
import 'package:heart_at_time/src/widgets/heart_icon.dart';

/// [ProfileEditScreen] es una pantalla que permite al usuario editar su perfil.
/// Esta pantalla tiene un diseño limpio y facilita la edición del nombre del usuario.
class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ocultar el teclado cuando se toca fuera de un campo de texto
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.04),
                decoration: const BoxDecoration(
                  color: Color(0xffFFF4EA),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Encabezado y formulario de edición
                    Column(
                      children: [
                        Column(
                          children: [
                            const HeartWithIcon(
                              iconName: Icons.settings,
                              showIcon: true,
                            ),
                            Text(
                              "Editar Perfil",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.07),
                            ),
                          ],
                        ),
                        // Sección de edición del nombre
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.15),
                                child: Text("Nombre",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04)),
                              ),
                              BarButtonSection(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: "John Smith",
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            vertical: 8)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Botón para guardar cambios
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Color(0xff0096D1)),
                            fixedSize: MaterialStatePropertyAll(Size(
                                MediaQuery.of(context).size.width * 0.7,
                                MediaQuery.of(context).size.height * 0.07)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        child: Text(
                          "Guardar Cambio",
                          style: TextStyle(
                              color: const Color(0xffFFF4EA),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.w100),
                        ))
                  ],
                ),
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
      ),
    );
  }
}
