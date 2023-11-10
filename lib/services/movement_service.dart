import 'package:dio/dio.dart';
import 'package:metastock/models/movement.dart';
import 'package:metastock/services/abstract_service.dart';

class MovementService extends AbstractService {
  Future<List<Movement>> liste() async {
    List<Movement> movements = [];
    Response? response = await callApi(endpoint: "/movements", method: "get");
    if (response?.data != null) {
      dynamic list = response!.data;
      for (dynamic element in list) {
        movements.add(Movement.fromJson(element));
      }
    }
    return movements;
  }

  Future<Movement?> view(int idMovement) async {
    Movement? movement;
    Response? response = await callApi(endpoint: "/movements/$idMovement", method: "get");
    if (response?.data != null) {
      movement = Movement.fromJson(response?.data);
    }
    return movement;
  }

  Future<Movement?> create(Movement movement) async {
    Movement? created;
    Response? response = await callApi(endpoint: "/movements", method: "post", formData: movement.toJson().remove("id"));
    if (response?.data != null) {
      created = Movement.fromJson(response?.data);
    }
    return created;
  }
}
