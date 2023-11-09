import 'package:flutter/material.dart';

import '../utils/constantes.dart';

class AppBarCustom extends AppBar {
  final void Function() onPressed;
  AppBarCustom({
    required this.onPressed,
    super.key,
  }) : super(
          backgroundColor: Constantes.couleurPrincipale,
          actions: [
            ElevatedButton(
              onPressed: onPressed,
              child: Icon(Icons.logout),
            ),
          ],
        );
}
