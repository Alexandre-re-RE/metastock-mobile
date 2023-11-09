import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/CustomWidget/app_bar_custom.dart';
import 'package:metastock/app_cubit.dart';
import 'package:metastock/listeProduit/cubit/liste_produit_cubit.dart';
import 'package:metastock/listeProduit/liste_porduit_view.dart';

import '../CustomWidget/dark_background_custom_widget.dart';
import '../CustomWidget/scafold_with_background.dart';

class ListeProduitPage extends StatelessWidget {
  const ListeProduitPage({Key? key}) : super(key: key);

  static MaterialPage page() => const MaterialPage(child: ListeProduitPage());

  @override
  Widget build(BuildContext context) {
    return ScafoldWithBackground(
      appBar:
          AppBarCustom(onPressed: () => context.read<AppCubit>().appLogout()),
      body: CustomWidgetBlackBackGround(
          widget: BlocProvider(
        create: (context) => ListeProduitCubit(),
        child: const ListeProduitView(),
      )),
    );
  }
}
