part of 'liste_produit_cubit.dart';

class ListeProduitState extends Equatable {
  const ListeProduitState({
    this.visibilityListePorduit = true,
  });

  final bool visibilityListePorduit;

  ListeProduitState copyWith({
    bool? visibilityListePorduit,
    Key? key,
  }) {
    return ListeProduitState(
      visibilityListePorduit:
          visibilityListePorduit ?? this.visibilityListePorduit,
    );
  }

  @override
  List<Object> get props => [
        visibilityListePorduit,
      ];
}
