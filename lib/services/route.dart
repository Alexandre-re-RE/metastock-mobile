import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/home/home_page.dart';

import '../app_cubit.dart';
import '../listeProduit/liste_produit_page.dart';
import '../login/login_page.dart';
import '../produit/produit_page.dart';

enum RouteStages {
  LoginPage,
  HomePage,
  ListeProduitPage,
  ProduitPage,
}

List<Page> onGeneratePagesApp(
  AppState appState,
  List<Page> pages,
) {
  switch (appState.routeStages) {
    case RouteStages.HomePage:
      return [HomePage.page()];
    case RouteStages.LoginPage:
      return [LoginPage.page()];
    case RouteStages.ListeProduitPage:
      return [
        ListeProduitPage.page(),
        if (appState.product != null) ProduitPage.page(),
      ];
    case RouteStages.ProduitPage:
      return [ProduitPage.page()];
  }
}

class RouteFlow extends StatelessWidget {
  const RouteFlow({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const RouteFlow(),
      );

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AppState>(
      onGeneratePages: onGeneratePagesApp,
      state: context.select((AppCubit cubit) => cubit.state),
    );
  }
}
