import 'package:flutter/material.dart';

class BarButtonSection extends StatelessWidget {
  final List<Widget> children;
  const BarButtonSection({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            bottom: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.width * 0.03),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff0096D1)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
        child: Column(
          children: children,
        ));
  }
}
