import 'package:dio/dio.dart';
import 'package:metastock/models/product.dart';
import 'package:metastock/services/abstract_service.dart';

class ProductService extends AbstractService {
  Future<List<Product>> liste() async {
    List<Product> products = [];
    Response? response = await get(endpoint: "/products");
    if (response?.data != null) {
      dynamic list = response!.data;
      for (dynamic element in list) {
        products.add(Product.fromJson(element));
      }
    }
    return products;
  }
}
