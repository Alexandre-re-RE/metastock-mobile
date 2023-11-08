import 'package:flutter/material.dart';
import 'package:metastock/const/color.dart';
import 'package:metastock/listeProduit/liste_produit_page.dart';

import 'package:flutter/material.dart';
import 'package:metastock/services/account_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:metastock/services/product_service.dart';
import 'package:metastock/utils/auth.dart';
import 'package:metastock/utils/constantes.dart';

import 'models/product.dart';

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
      navigatorKey: Constantes.navigatorKey,
      title: 'Metastock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 20, backgroundColor: couleurPrincipale),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:
              // const HomePage(),
              // const LoginPage(),
              const ListeProduitPage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _incrementCounter() async {
    ProductService service = ProductService();
    //await service.login(username: "logistician", password: "logistician");
    List<Product> products = await service.liste();
    print(products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Builder(builder: (BuildContext contex) {
        if (AuthUtils.isAuth()) {
          return Text("your logged");
        }

        return Text("your not logged");
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
