part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.routeStages = RouteStages.HomePage,
    this.product,
    this.token,
  });

  final RouteStages routeStages;
  final Product? product;
  final Token? token;

  AppState copyWith({
    Token? token,
    RouteStages? routeStages,
    Product? Function()? product,
  }) {
    return AppState(
      token: token ?? this.token,
      routeStages: routeStages ?? this.routeStages,
      product: product != null ? product() : this.product,
    );
  }

  @override
  List<Object?> get props => [
        routeStages,
        product,
      ];
}
