import 'package:flutter/material.dart';
import 'package:metastock/produit/produit_view.dart';

import '../CustomWidget/dark_background_custom_widget.dart';
import '../CustomWidget/scafold_with_background.dart';

class ProduitPage extends StatelessWidget {
  const ProduitPage({Key? key}) : super(key: key);

  static MaterialPage page() => const MaterialPage(child: ProduitPage());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //TODO : deselection object
        return true;
      },
      child: ScafoldWithBackground(
          body: const CustomWidgetBlackBackGround(widget: ProduitView())),
    );
  }
}
