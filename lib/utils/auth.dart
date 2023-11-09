import 'package:metastock/utils/constantes.dart';

class AuthUtils {
  static bool isAuth() {
    print("isAuth");
    return Constantes.box.hasData("token");
  }
}
