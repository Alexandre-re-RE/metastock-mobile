import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/CustomWidget/app_bar_custom.dart';
import 'package:metastock/produit/cubit/produit_cubit.dart';
import 'package:metastock/produit/produit_view.dart';

import '../CustomWidget/dark_background_custom_widget.dart';
import '../CustomWidget/scafold_with_background.dart';
import '../app_cubit.dart';

class ProduitPage extends StatelessWidget {
  const ProduitPage({Key? key}) : super(key: key);

  static MaterialPage page() => const MaterialPage(child: ProduitPage());

  @override
  Widget build(BuildContext context) {
    AppCubit AppCubitRead = context.read<AppCubit>();

    return WillPopScope(
      onWillPop: () async {
        AppCubitRead.changeProduitSelect();
        return true;
      },
      child: ScafoldWithBackground(
          appBar: AppBarCustom(onPressed: () => AppCubitRead.appLogout()),
          body: CustomWidgetBlackBackGround(
              widget: BlocProvider(
                  create: (context) => ProduitCubit(
                      appCubit: AppCubitRead,
                      product: AppCubitRead.state.product!),
                  child: ProduitView()))),
    );
  }
}
