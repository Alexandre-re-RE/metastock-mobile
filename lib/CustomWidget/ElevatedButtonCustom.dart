import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  ElevatedButtonCustom({super.key, required this.textButton});

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
