import 'package:flutter/material.dart';
import 'package:metastock/produit/produit_view.dart';

import '../CustomWidget/dark_background_custom_widget.dart';

class ProduitPage extends StatelessWidget {
  const ProduitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomWidgetBlackBackGround(widget: ProduitView());
  }
}
