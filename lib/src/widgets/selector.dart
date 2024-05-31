import 'package:flutter/material.dart';

/// El widget [Selector] es un selector de opciones que permite al usuario elegir entre diferentes períodos de tiempo.
class Selector extends StatefulWidget {
  const Selector({super.key});

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45), color: const Color(0xff3EBDC6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: _index == 0 ? const Color(0xff0096D1) : const Color(0xff3EBDC6),
            ),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
                child: const Text("Hoy",
                    style: TextStyle(
                      color: Color(0xffFFF4EA),
                    ))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: _index == 1 ? const Color(0xff0096D1) : const Color(0xff3EBDC6),
            ),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
                child: const Text("Semana",
                    style: TextStyle(
                      color: Color(0xffFFF4EA),
                    ))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: _index == 2 ? const Color(0xff0096D1) : const Color(0xff3EBDC6),
            ),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _index = 2;
                  });
                },
                child: const Text("Mes",
                    style: TextStyle(
                      color: Color(0xffFFF4EA),
                    ))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: _index == 3 ? const Color(0xff0096D1) : const Color(0xff3EBDC6),
            ),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _index = 3;
                  });
                },
                child: const Text("Año",
                    style: TextStyle(
                      color: Color(0xffFFF4EA),
                    ))),
          ),
        ],
      ),
    );
  }
}
