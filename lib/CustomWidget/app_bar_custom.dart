import 'package:flutter/material.dart';

import '../utils/constantes.dart';

class AppBarCustom extends AppBar {
  final void Function() onPressed;
  final void Function()? onPressedRefresh;
  AppBarCustom({
    required this.onPressed,
    this.onPressedRefresh,
    super.key,
  }) : super(
          backgroundColor: Constantes.couleurPrincipale,
          actions: [
            // ElevatedButton(
            //   onPressed: onPressedRefresh,
            //   child: Icon(Icons.refresh),
            // ),
            ElevatedButton(
              onPressed: onPressed,
              child: Icon(Icons.logout),
            ),
          ],
        );
}
