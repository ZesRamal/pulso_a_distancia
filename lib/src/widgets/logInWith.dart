import 'package:flutter/material.dart';

/// El widget [LogInWith] muestra opciones para iniciar sesión con diferentes plataformas.
class LogInWith extends StatelessWidget {
  const LogInWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
          child: Text(
            "O inicia sesión con",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: const Color(0xff0096D1)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.g_mobiledata,
                  size: MediaQuery.of(context).size.width * 0.15,
                  color: const Color(0xff0096D1),
                ),
                padding: EdgeInsets.zero,
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Color(0xff0096D1), width: 1))),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.facebook,
                  size: MediaQuery.of(context).size.width * 0.15,
                  color: const Color(0xff0096D1),
                ),
                padding: EdgeInsets.zero,
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Color(0xff0096D1), width: 1))),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.apple,
                  size: MediaQuery.of(context).size.width * 0.15,
                  color: const Color(0xff0096D1),
                ),
                padding: EdgeInsets.zero,
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Color(0xff0096D1), width: 1))),
              )
            ],
          ),
        )
      ],
    );
  }
}
