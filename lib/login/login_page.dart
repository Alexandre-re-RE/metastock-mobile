import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/login/cubit/login_cubit.dart';
import 'package:metastock/login/login_view.dart';

import '../CustomWidget/scafold_with_background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static MaterialPage page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return ScafoldWithBackground(
      body: BlocProvider(
        child: LoginView(),
        create: (context) => LoginCubit(),
      ),
    );
  }
}
