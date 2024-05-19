import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType inputType;
  final String label;
  final bool obscureText;

  const InputField(
    this.label,
    this.inputType, {
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
          style: TextStyle(color: Color(0xff0096D1)),
          keyboardType: inputType,
          obscureText: obscureText,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.015,
                  horizontal: MediaQuery.of(context).size.height * 0.01),
              isDense: true,
              labelText: label,
              labelStyle: TextStyle(color: Color(0xff0096D1)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff0096D1))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff0096D1), width: 2)),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ))),
    );
  }
}
