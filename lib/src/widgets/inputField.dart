import 'package:flutter/material.dart';

/// El widget [InputField] es un campo de entrada de texto personalizado.
class InputField extends StatelessWidget {
  final TextInputType inputType;
  final String label;
  final bool obscureText;

  /// Crea un widget [InputField].
  ///
  /// [label] es el texto que se mostrará como etiqueta del campo de entrada.
  /// [inputType] es el tipo de datos que se espera en el campo de entrada.
  /// [obscureText] determina si el texto ingresado debe ocultarse, por ejemplo, en el caso de contraseñas.
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
          style: const TextStyle(color: Color(0xff0096D1)),
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
              labelStyle: const TextStyle(color: Color(0xff0096D1)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff0096D1))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff0096D1), width: 2)),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ))),
    );
  }
}
