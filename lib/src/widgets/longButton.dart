import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String text;
  final void Function() action;
  const LongButton(
    this.text,
    this.action, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: action,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xff0096D1)),
            fixedSize: MaterialStatePropertyAll(Size(
                MediaQuery.of(context).size.width * 0.7,
                MediaQuery.of(context).size.height * 0.07)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
        child: Text(
          text,
          style: TextStyle(
              color: Color(0xffFFF4EA),
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontWeight: FontWeight.w100),
        ));
  }
}
