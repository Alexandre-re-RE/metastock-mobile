import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  ElevatedButtonCustom({super.key, required this.textButton, this.onPressed});

  final String textButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: const Size(150, 60),
      ),
      child:
          Text(textButton, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
