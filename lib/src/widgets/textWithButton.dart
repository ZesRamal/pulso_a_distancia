import 'package:flutter/material.dart';

class TextWithButton extends StatelessWidget {
  final String text;
  final String buttonText;
  final void Function() action;
  const TextWithButton(
    this.text,
    this.buttonText,
    this.action, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$text ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff0096D1),
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w100)),
        TextButton(
          onPressed: action,
          style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.zero),
              splashFactory: NoSplash.splashFactory,
              enableFeedback: false),
          child: Text("$buttonText",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0096D1),
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold,
              )),
        )
      ],
    );
  }
}
