import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:metastock/services/account_service.dart';
import 'package:metastock/services/route.dart';
import 'package:metastock/utils/constantes.dart';

import 'models/product.dart';
import 'models/token.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState()) {}

  AccountService service = AccountService();

  void changePage(
    RouteStages routeStages,
  ) {
    emit(state.copyWith(
      routeStages: routeStages,
    ));
  }

  void changeToken(Token token) {
    emit(state.copyWith(token: token));
  }

  Future<void> appLogout() async {
    emit(state.copyWith(
        token: Token(token: ""), routeStages: RouteStages.LoginPage));
    AccountService.logout();
  }

  Future<void> login({
    required String username,
    required String password,
    required AppCubit appCubit,
  }) async {
    bool loggedSuccesful =
        await service.login(username: username, password: password);
    if (!loggedSuccesful) {
      Constantes.showSnackBar(info: "Iddentifiants incorrect");
      return;
    }
    emit(state.copyWith(
        routeStages: RouteStages.ListeProduitPage,
        token: Token(token: Constantes.box.read("token"))));
  }
}
