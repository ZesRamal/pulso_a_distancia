import 'package:flutter/material.dart';

/// El widget [InfoCard] muestra información en forma de tarjeta.
class InfoCard extends StatelessWidget {
  final String title;
  final String info;
  /// Crea un widget [InfoCard].
  ///
  /// [title] es el título de la tarjeta.
  /// [info] es la información que se mostrará en la tarjeta.
  const InfoCard({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0096D1)),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            info,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
