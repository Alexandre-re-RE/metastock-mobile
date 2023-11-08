import 'package:flutter/material.dart';
import 'package:metastock/produit/produit_view.dart';

import '../CustomWidget/darkBackgroundCustomWidget.dart';

class ProduitPage extends StatelessWidget {
  const ProduitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWidgetBlackBackGround(widget: ProduitView());
  }
}
