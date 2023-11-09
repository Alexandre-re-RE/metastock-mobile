import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:metastock/utils/constantes.dart';

import 'account_service.dart';

abstract class AbstractService {
  Future<Response?> callApi({required String endpoint, required String method, Map<String, dynamic>? queries, Map<String, dynamic>? formData}) async {
    String bearer = "";

    if (Constantes.box.hasData("token")) {
      Map<String, dynamic> token = jsonDecode(Constantes.box.read("token"));
      bearer = token["access_token"];
    }

    Response? response;
    try {
      response = await Dio().request(
        data: formData,
        options: Options(
          method: method,
          headers: {"Authorization": "Bearer $bearer"},
          contentType: ContentType.json.toString(),
          responseType: ResponseType.json,
        ),
        "${Constantes.apiUrl}$endpoint",
        queryParameters: queries,
      );
    } on DioException catch (e) {
      response = e.response;
    }

    if (response != null) {
      switch (response.statusCode) {
        case 401:
          AccountService.logout();
          Constantes.showSnackBar(info: "Session expirée veuillez vous reconnecter (401)");
          break;
        case 403:
          Constantes.showSnackBar(info: "Vous ne disposez pas d'autorisation nécessaire pour réaliser cette action (403)");
          break;
        case 500:
          Constantes.showSnackBar(info: "Erreur serveur (500)");
          break;
        default:
          if (response.statusCode! >= 300 && response.statusCode != 304) {
            Constantes.showSnackBar(info: " ${response.statusMessage} (${response.statusCode})");
          }
          break;
      }
    }

    return response;
  }
}
