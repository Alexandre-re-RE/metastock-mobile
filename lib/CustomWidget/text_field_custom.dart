import 'package:flutter/material.dart';
import 'package:metastock/const/color.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final bool isPassword;

  const TextFieldCustom({
    super.key,
    required this.labelText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: couleurPrincipale, width: 2.0),
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
