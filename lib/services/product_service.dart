import 'package:dio/dio.dart';
import 'package:metastock/models/movement.dart';
import 'package:metastock/models/product.dart';
import 'package:metastock/services/abstract_service.dart';

class ProductService extends AbstractService {
  Future<List<Product>> listeDeProduit() async {
    List<Product> products = [];
    Response? response = await callApi(endpoint: "/products", method: "get");
    if (response?.data != null && response?.data is List) {
      dynamic list = response!.data;
      for (dynamic element in list) {
        products.add(Product.fromJson(element));
      }
    }
    return products;
  }

  Future<Product?> view(int idProduct) async {
    Product? product;
    Response? response =
        await callApi(endpoint: "/products/$idProduct", method: "get");
    if (response?.data != null) {
      product = Product.fromJson(response?.data);
    }
    return product;
  }

  Future<Product?> create(Product product) async {
    Map<String, dynamic> formData = product.toJson();
    formData.remove("id");
    print(product.name);
    print(product.toJson().remove("id"));
    Product? created;
    Response? response = await callApi(
        endpoint: "/products", method: "post", formData: formData);

    if (response?.data != null) {
      created = Product.fromJson(response?.data);
    }
    return created;
  }

  Future<Product?> update(Product product) async {
    Product? updated;
    Response? response = await callApi(
        endpoint: "/products/${product.id}",
        method: "put",
        formData: product.toJson());
    if (response?.data != null) {
      updated = Product.fromJson(response?.data);
    }
    return updated;
  }

  Future<List<Movement>> movements(int idProduct) async {
    List<Movement> movements = [];
    Response? response = await callApi(
        endpoint: "/products/$idProduct/movements", method: "get");
    if (response?.data != null) {
      dynamic list = response!.data;
      for (dynamic element in list) {
        movements.add(Movement.fromJson(element));
      }
    }
    return movements;
  }
}
