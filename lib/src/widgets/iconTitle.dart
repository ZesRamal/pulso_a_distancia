import 'package:flutter/material.dart';

class IconTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double iconSize;
  final double titleSize;
  final double subtitleSize;
  const IconTitle(
    this.icon,
    this.title,
    this.subtitle, {
    super.key,
    this.iconSize = 46,
    this.titleSize = 28,
    this.subtitleSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xff0096D1),
          size: iconSize,
        ),
        Text(title,
            style: TextStyle(
                color: Color(0xff0096D1),
                fontSize: titleSize,
                fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff0096D1),
                  fontSize: subtitleSize,
                  fontWeight: FontWeight.w100)),
        ),
      ],
    );
  }
}
