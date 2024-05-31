import 'package:flutter/material.dart';

/// El widget [BarButtonSection] se utiliza para mostrar una sección de botones en la pantalla.
class BarButtonSection extends StatelessWidget {
  final List<Widget> children;
  const BarButtonSection({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // Establece el ancho del contenedor como el 80% del ancho de la pantalla.
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            bottom: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.width * 0.03),
        // Configura la decoración del contenedor.
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff0096D1)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
        // Define la columna de widgets hijos dentro del contenedor.
        child: Column(
          children: children,
        ));
  }
}
