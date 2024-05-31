import 'package:flutter/material.dart';

/// El widget [OptionBarButton] representa un botón de opción que al hacer clic navega a una pantalla específica.
class OptionBarButton extends StatelessWidget {
  // Texto que se muestra en el botón.
  final String text;
  // Widget al que se navegará al hacer clic en el botón.
  final Widget pushTo;
  const OptionBarButton({
    super.key,
    required this.text,
    required this.pushTo,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pushTo),
        );
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.width * 0.03),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
          const Text(
            ">",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
