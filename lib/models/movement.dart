import 'package:json_annotation/json_annotation.dart';

part 'movement.g.dart';

@JsonSerializable()
class Movement {
  final int id, quantity;
  final bool archive;
  final String comment, date;

  @JsonKey(name: "product_id")
  final int productId;

  @JsonKey(name: "account_id")
  final int accountId;

  @JsonKey(name: "movement_type")
  final String movementType;

  Movement(this.archive, this.id, this.quantity, this.comment, this.date,
      this.productId, this.accountId, this.movementType);

  /// Connect the generated [_$MovementFromJson] function to the `fromJson`
  /// factory.
  factory Movement.fromJson(Map<String, dynamic> json) =>
      _$MovementFromJson(json);

  /// Connect the generated [_$MovementToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovementToJson(this);
}
