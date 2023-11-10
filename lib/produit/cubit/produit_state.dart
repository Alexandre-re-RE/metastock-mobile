part of 'produit_cubit.dart';

class ProduitState extends Equatable {
  ProduitState({
    required this.product,
    required this.id,
    required this.name,
    required this.description,
    required this.threshold,
    required this.stock,
    required this.uniprice,
    required this.archive,
    required this.picture,
  });

  final Product product;
  final int id;
  final String name;
  final String description;
  final String picture;
  final int threshold;
  final int stock;
  final double uniprice;
  final bool archive;

  ProduitState copyWith({
    Product? product,
    int? id,
    String? name,
    String? description,
    int? threshold,
    int? stock,
    double? uniprice,
    bool? archive,
    String? picture,
  }) {
    return ProduitState(
      product: product ?? this.product,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      picture: picture ?? this.picture,
      stock: stock ?? this.stock,
      threshold: threshold ?? this.threshold,
      uniprice: uniprice ?? this.uniprice,
      archive: archive ?? this.archive,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        description,
        picture,
        threshold,
        stock,
        uniprice,
        archive,
      ];
}
