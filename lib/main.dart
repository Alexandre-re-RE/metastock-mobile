import 'dart:convert';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
        title: Text("MetaStock"),
        actions: [
          IconButton(
            onPressed: () async {
              AccountService service = AccountService();
              await service.login(
                  username: "logistician", password: "logistician");
            },
            icon: Icon(Icons.login),
          )
        ],
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
