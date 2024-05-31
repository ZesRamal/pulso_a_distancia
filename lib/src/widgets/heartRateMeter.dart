import 'package:flutter/material.dart';

/// El widget [HeartRateMeter] muestra el ritmo cardíaco actual en forma de un medidor de frecuencia cardíaca.
class HeartRateMeter extends StatelessWidget {
  // El ritmo cardíaco actual en pulsos por minuto (bpm).
  final int bpm;
  // El tiempo relacionado con el ritmo cardíaco.
  final String tiempo;

  const HeartRateMeter({
    super.key,
    required this.bpm,
    this.tiempo = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.2),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: const Color(0xffFDA5A0),
                size: 220,
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 25,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bpm.toString(),
                    style: const TextStyle(
                        color: Color(0xff0096D1), fontSize: 64, height: 1.1),
                  ),
                  const Text(
                    "ppm",
                    style: TextStyle(
                        color: Color(0xff0096D1), fontSize: 24, height: 1),
                  )
                ],
              )
            ],
          ),
          const Text(
            "",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 16, color: Color(0xff0096D1), height: 0.1),
          )
        ],
      ),
    );
  }
}
