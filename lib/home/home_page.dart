import 'package:flutter/material.dart';
import 'package:metastock/home/home_view.dart';

import '../CustomWidget/scafold_with_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static MaterialPage page() => const MaterialPage(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return ScafoldWithBackground(body: const HomeView());
  }
}
