import 'package:flutter/material.dart';

import '../utils/constantes.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final Function(String)? onChanged;
  //final TextEditingController? controller;

  const TextFieldCustom({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.onChanged,
    //this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        onChanged: onChanged,
        //controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Constantes.couleurPrincipale, width: 2.0),
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
