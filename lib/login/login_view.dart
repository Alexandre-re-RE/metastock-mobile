import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/CustomWidget/ElevatedButtonCustom.dart';
import 'package:metastock/login/cubit/login_cubit.dart';

import '../CustomWidget/text_field_custom.dart';
import '../app_cubit.dart';
import '../utils/constantes.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit cubitWatch = context.watch<LoginCubit>();
    LoginCubit cubitRead = context.read<LoginCubit>();
    AppCubit appCubitRead = context.read<AppCubit>();

    return Stack(
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
                  style: TextStyle(
                      color: Constantes.couleurPrincipale,
                      decoration: TextDecoration.none,
                      fontSize: 35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldCustom(
                  onChanged: (value) => cubitRead.onChangeUsername(value),
                  labelText: "Username",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldCustom(
                  onChanged: (value) => cubitRead.onChangePassword(value),
                  labelText: "Password",
                  isPassword: false,
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
                    appCubitRead.login(
                      appCubit: appCubitRead,
                      username: cubitWatch.state.username,
                      password: cubitWatch.state.password,
                    );
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
