import 'package:flutter/material.dart';
import 'package:heart_at_time/distance_user_page.dart';

/// El widget [DistanceUserCard] muestra información sobre un usuario y permite navegar a la página de detalles del usuario.
class DistanceUserCard extends StatelessWidget {
  const DistanceUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DistanceUserPage()),
        );
      },
      style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    "John Smith  ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    "Desconectado",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFF4EA),
                        backgroundColor: Color(0xff028B95)),
                  ),
                ]),
                Row(
                  children: [
                    Text(
                      "Estado: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "Desconocido",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
            Heart(),
          ],
        ),
      ),
    );
  }
}

/// El widget [Heart] muestra un icono de corazón con un valor de frecuencia cardíaca.
class Heart extends StatelessWidget {
  const Heart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.favorite,
          color: const Color(0xffFDA5A0),
          size: 100,
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 25,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "--",
              style: TextStyle(
                  color: Color(0xff0096D1), fontSize: 32, height: 1.1),
            ),
            Text(
              "ppm",
              style:
                  TextStyle(color: Color(0xff0096D1), fontSize: 12, height: 1),
            )
          ],
        )
      ],
    );
  }
}
