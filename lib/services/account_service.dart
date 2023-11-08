import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:metastock/main.dart';

import '../utils/constantes.dart';

class AccountService {
  Future<bool> login({required String username, required String password}) async {
    try {
      Response response = await Dio().post(
        data: {"grant_type": "password", "client_id": "api", "client_secret": Constantes.clientSecret, "scope": "openid", "username": username, "password": password},
        options: Options(
          contentType: "application/x-www-form-urlencoded",
        ),
        Constantes.keyCloackAuthUrl,
      );
      print(response);

      Constantes.box.write("token", jsonEncode(response.data));
      //print(Constantes.box.read("token"));
      return true;
    } on DioException catch (e) {
      Constantes.showSnackBar(info: "${e.response?.statusMessage} ${e.response?.statusCode}");
    }

    return false;
  }

  static void logout() {
    Constantes.box.erase();
    Navigator.of(Constantes.navigatorKey.currentContext!).pushReplacement(MaterialPageRoute(builder: (_) => const MyApp()));
  }
}
