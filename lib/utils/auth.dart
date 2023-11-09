import 'package:metastock/utils/constantes.dart';

class AuthUtils {
  static bool isAuth() {
    return Constantes.box.hasData("token");
  }
}
