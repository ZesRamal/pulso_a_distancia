import 'package:flutter/material.dart';

class HeartWithIcon extends StatelessWidget {
  final IconData iconName;
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
          color: Color(0xffFDA5A0),
          size: MediaQuery.of(context).size.width * 0.4,
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 25,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        showIcon
            ? Icon(
                iconName,
                color: Color(0xff0096D1),
                size: MediaQuery.of(context).size.width * 0.18,
              )
            : Text("")
      ],
    );
  }
}
