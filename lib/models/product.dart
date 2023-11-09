import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final int stock;
  final int? threshold;
  final bool archive;
  final String? description;
  final String? name;
  final String? picture;

  @JsonKey(name: "unitPrice")
  final double? unitprice;

  Product(this.archive, this.id, this.stock, this.description, this.name, this.picture, this.unitprice, this.threshold);

  /// Connect the generated [_$ProductFromJson] function to the `fromJson`
  /// factory.
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Connect the generated [_$ProductToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
