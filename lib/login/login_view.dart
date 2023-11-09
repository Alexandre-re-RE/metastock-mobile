import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metastock/CustomWidget/elevated_button_custom.dart';
import 'package:metastock/listeProduit/liste_produit_page.dart';
import 'package:metastock/services/account_service.dart';

import '../CustomWidget/text_field_custom.dart';
import '../utils/constantes.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  Future<void> login({required String username, required String password}) async {
    AccountService service = AccountService();
    bool loggedSuccesful = await service.login(username: username, password: password);
    if (loggedSuccesful) {
      Navigator.of(Constantes.navigatorKey.currentContext!).pushReplacement(MaterialPageRoute(builder: (_) => const ListeProduitPage()));
    }
    Constantes.showSnackBar(info: "Iddentifiants incorrect");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerUsername = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();

    return const Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "MetaStock",
                  style: TextStyle(color: Constantes.couleurPrincipale, decoration: TextDecoration.none, fontSize: 35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldCustom(
                  labelText: "Username",
                  controller: controllerUsername,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldCustom(
                  labelText: "Password",
                  isPassword: true,
                  controller: controllerPassword,
                ),
              ),
            ],
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButtonCustom(
                  textButton: "Connexion",
                  onPressed: () {
                    login(username: controllerUsername.text, password: controllerPassword.text);
                  },
                ),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
