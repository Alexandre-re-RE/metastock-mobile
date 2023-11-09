import 'package:flutter/material.dart';
import 'package:metastock/listeProduit/liste_produit_page.dart';

import 'package:get_storage/get_storage.dart';
import 'package:metastock/utils/auth.dart';
import 'package:metastock/utils/constantes.dart';

import 'login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Constantes.navigatorKey,
      title: 'Metastock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 20, backgroundColor: Constantes.couleurPrincipale),
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Builder(builder: (_) {
              if (AuthUtils.isAuth()) {
                return const ListeProduitPage();
              }

              return LoginPage();
            })),
      ),
    );
  }
}
