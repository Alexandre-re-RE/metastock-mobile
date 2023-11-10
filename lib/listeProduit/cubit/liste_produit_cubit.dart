import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metastock/app_cubit.dart';

import '../../CustomWidget/mouvement_card_custom_widget.dart';
import '../../CustomWidget/produit_card_custom_widget.dart';
import '../../models/product.dart';
import '../../services/product_service.dart';

part 'liste_produit_state.dart';

class ListeProduitCubit extends Cubit<ListeProduitState> {
  ListeProduitCubit() : super(const ListeProduitState()) {
    changeListeProduit();
  }

  ProductService service = ProductService();

  void changeVisibility({required int index}) {
    if (index == 0) {
      emit(state.copyWith(
        visibilityListePorduit: true,
      ));
    }
    if (index == 1) {
      emit(state.copyWith(
        visibilityListePorduit: false,
      ));
    }
  }

  Future<void> changeListeProduit() async {
    ProductService productService = ProductService();
    List<Product> listeProduit = await productService.listeDeProduit();
    emit(
      state.copyWith(listProduit: listeProduit),
    );
  }

  TypeMouvement getRandomTypeMouvement() {
    // Création d'une instance de Random
    final random = Random();

    // Génération d'un index aléatoire basé sur le nombre d'éléments dans l'énum
    int index = random.nextInt(TypeMouvement.values.length);

    // Retourne la valeur de l'énum correspondant à l'index aléatoire
    return TypeMouvement.values[index];
  }

  int getRandomNumber() {
    // Crée une instance de Random
    final random = Random();
    // Génère un nombre aléatoire entre 0 (inclus) et 101 (exclus)
    return random.nextInt(101);
  }

  // Fonction pour générer un Product avec des valeurs aléatoires
  Product generateRandomProduct() {
    final random = Random();
    return Product(
        random.nextBool(),
        random.nextInt(100),
        random.nextInt(100),
        'Description ${random.nextInt(1000)}',
        'Product ${random.nextInt(1000)}',
        'assets/image/metastock.png',
        random.nextInt(500) + 1,
        random.nextInt(100));
  }

// Fonction pour générer une liste de ProduitCardCustomWidget avec des Products aléatoires
  List<ProduitCardCustomWidget> generateRandomProductCards(int count) {
    return List.generate(
        count,
        (index) => ProduitCardCustomWidget(
              product: generateRandomProduct(),
              onTap: () {},
            ));
  }

  List<ProduitCardCustomWidget> generateProductCards(AppCubit context) {
    List<Product> products = state.listProduit;
    return products
        .map((product) => ProduitCardCustomWidget(
              product: product,
              onTap: () => context.changeProduitSelect(product: product),
            ))
        .toList();
  }

  void createPorduct() {
    Product product = Product(false, 0, 0, "New Product : description",
        "New Product : name", "New Product : picture url", 0, 0);
    service.create(product);
  }
}
