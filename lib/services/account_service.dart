import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:metastock/models/account.dart';
import 'package:metastock/services/abstract_service.dart';

import '../utils/constantes.dart';

class AccountService extends AbstractService {
  Future<bool> login(
      {required String username, required String password}) async {
    try {
      Response response = await Dio().post(
        data: {
          "grant_type": "password",
          "client_id": "api",
          "client_secret": Constantes.clientSecret,
          "scope": "openid",
          "username": username,
          "password": password
        },
        options: Options(
          contentType: "application/x-www-form-urlencoded",
        ),
        Constantes.keyCloackAuthUrl,
      );
      print("response :");
      print(response);

      Constantes.box.write("token", jsonEncode(response.data));

      //print(Constantes.box.read("token"));
      return true;
    } on DioException catch (e) {
      Constantes.showSnackBar(
          info: "${e.response?.statusMessage} ${e.response?.statusCode}");
    }

    return false;
  }

  static void logout() {
    print("token :");
    print(Constantes.box.read("token"));
    Constantes.box.erase();
  }

  Future<List<Account>> liste() async {
    List<Account> accounts = [];
    Response? response = await callApi(endpoint: "/accounts", method: "get");
    if (response?.data != null) {
      dynamic list = response!.data;
      for (dynamic element in list) {
        accounts.add(Account.fromJson(element));
      }
    }
    return accounts;
  }

  Future<Account?> view(int idAccount) async {
    Account? account;
    Response? response =
        await callApi(endpoint: "/accounts/$idAccount", method: "get");
    if (response?.data != null) {
      account = Account.fromJson(response?.data);
    }
    return account;
  }

  Future<Account?> create(Account account) async {
    Account? created;
    Response? response = await callApi(
        endpoint: "/accounts", method: "post", formData: account.toJson());
    if (response?.data != null) {
      created = Account.fromJson(response?.data);
    }
    return created;
  }

  Future<Account?> update(Account account) async {
    Account? updated;
    Response? response = await callApi(
        endpoint: "/accounts/${account.id}",
        method: "put",
        formData: account.toJson());
    if (response?.data != null) {
      updated = Account.fromJson(response?.data);
    }
    return updated;
  }
}
