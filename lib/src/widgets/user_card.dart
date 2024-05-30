import 'package:flutter/material.dart';
import 'package:heart_at_time/distance_user_page.dart';
import 'package:heart_at_time/src/providers/hear_rate_provider.dart';
import 'package:provider/provider.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    "Ricardo Escobar  ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    "Conectado",
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
                      "Reposo",
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

class Heart extends StatefulWidget {
  const Heart({
    super.key,
  });

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.favorite,
          color: Color(0xffFDA5A0),
          size: 100,
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 25,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<HeartRateProvider>().heartRate.toString(),
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
