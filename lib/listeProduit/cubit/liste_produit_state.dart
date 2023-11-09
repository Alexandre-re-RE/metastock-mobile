part of 'liste_produit_cubit.dart';

class ListeProduitState extends Equatable {
  const ListeProduitState({
    this.visibilityListePorduit = true,
    this.listProduit = const [],
  });

  final bool visibilityListePorduit;
  final List<Product> listProduit;

  ListeProduitState copyWith({
    bool? visibilityListePorduit,
    List<Product>? listProduit,
  }) {
    return ListeProduitState(
      visibilityListePorduit:
          visibilityListePorduit ?? this.visibilityListePorduit,
      listProduit: listProduit ?? this.listProduit,
    );
  }

  @override
  List<Object> get props => [
        visibilityListePorduit,
        listProduit,
      ];
}
