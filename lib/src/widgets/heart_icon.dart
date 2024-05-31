import 'package:flutter/material.dart';

/// El widget [HeartWithIcon] muestra un ícono en forma de corazón con una superposición opcional de otro ícono.
class HeartWithIcon extends StatelessWidget {
  // El nombre del ícono del corazón.
  final IconData iconName;
  // Booleano que indica si se debe mostrar el ícono.
  final bool showIcon;
  const HeartWithIcon({
    super.key,
    required this.iconName,
    required this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.favorite,
          color: const Color(0xffFDA5A0),
          size: MediaQuery.of(context).size.width * 0.4,
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 25,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        showIcon
            ? Icon(
                iconName,
                color: const Color(0xff0096D1),
                size: MediaQuery.of(context).size.width * 0.18,
              )
            : const Text("")
      ],
    );
  }
}
