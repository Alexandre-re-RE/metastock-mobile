import 'package:flutter/material.dart';

import '../CustomWidget/elevated_button_custom.dart';
import '../utils/constantes.dart';
import '../CustomWidget/elevated_button_custom.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
                child: Image(image: AssetImage("assets/image/metastock.png"), height: 100),
              ),
              Text(
                "MetaStock",
                style: TextStyle(color: Constantes.couleurPrincipale, decoration: TextDecoration.none, fontSize: 35),
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
                child: ElevatedButtonCustom(textButton: "Get Started"),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
