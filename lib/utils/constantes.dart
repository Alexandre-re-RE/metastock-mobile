import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Constantes {
  static const TextStyle styleSmall = TextStyle(fontSize: 10);
  static const couleurPrincipale = Color(0xFF005DA5);
  static String apiUrl = "http://10.0.2.2:8080/metastock-rest-api/rest";
  static String keyCloackAuthUrl =
      "https://metastock.alexandre.re:8443/realms/metastock/protocol/openid-connect/token";
  static String clientSecret = "MYyFte3ix2fjIyIv9XaN4CoO3oAQlD5x";
  static final box = GetStorage();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void showSnackBar({required String info}) {
    ScaffoldMessenger.of(Constantes.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(info, textAlign: TextAlign.center),
        duration: const Duration(milliseconds: 3500),
        width: 280.0, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
