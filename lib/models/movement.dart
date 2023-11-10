import 'package:json_annotation/json_annotation.dart';
import 'package:metastock/models/product.dart';

part 'movement.g.dart';

@JsonSerializable()
class Movement {
  final int id;
  final int quantity;
  final String? comment;
  final String? date;
  final Product product;

  @JsonKey(name: "product_id")
  final int productId;

  @JsonKey(name: "account_id")
  final int accountId;

  @JsonKey(name: "movement_type")
  final String movementType;

  Movement(this.id, this.quantity, this.comment, this.date, this.productId, this.accountId, this.movementType, this.product);

  /// Connect the generated [_$MovementFromJson] function to the `fromJson`
  /// factory.
  factory Movement.fromJson(Map<String, dynamic> json) => _$MovementFromJson(json);

  /// Connect the generated [_$MovementToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovementToJson(this);
}
