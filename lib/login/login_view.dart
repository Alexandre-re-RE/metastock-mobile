import 'package:flutter/material.dart';
import 'package:metastock/CustomWidget/elevated_button_custom.dart';

import '../CustomWidget/text_field_custom.dart';
import '../const/color.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "MetaStock",
                  style: TextStyle(
                      color: couleurPrincipale,
                      decoration: TextDecoration.none,
                      fontSize: 35),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFieldCustom(labelText: "Email"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFieldCustom(labelText: "Password", isPassword: true),
              ),
            ],
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButtonCustom(textButton: "Connexion"),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
