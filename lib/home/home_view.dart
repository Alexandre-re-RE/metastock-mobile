import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/CustomWidget/ElevatedButtonCustom.dart';

import '../app_cubit.dart';
import '../services/route.dart';
import '../utils/constantes.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubitRead = context.read<AppCubit>();
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                    image: AssetImage("assets/image/metastock.png"),
                    height: 100),
              ),
              Text(
                "MetaStock",
                style: TextStyle(
                    color: Constantes.couleurPrincipale,
                    decoration: TextDecoration.none,
                    fontSize: 35),
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
                  textButton: "Get Started",
                  onPressed: () =>
                      appCubitRead.changePage(RouteStages.LoginPage),
                ),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
