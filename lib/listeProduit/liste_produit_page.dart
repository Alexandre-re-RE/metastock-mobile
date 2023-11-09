import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/listeProduit/cubit/liste_produit_cubit.dart';
import 'package:metastock/listeProduit/liste_porduit_view.dart';

import '../CustomWidget/dark_background_custom_widget.dart';

class ListeProduitPage extends StatelessWidget {
  const ListeProduitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWidgetBlackBackGround(
        widget: BlocProvider(
      create: (context) => ListeProduitCubit(),
      child: const ListeProduitView(),
    ));
  }
}
