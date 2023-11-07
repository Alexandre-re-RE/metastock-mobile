// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movement _$MovementFromJson(Map<String, dynamic> json) => Movement(
      json['archive'] as bool,
      json['id'] as int,
      json['quantity'] as int,
      json['comment'] as String,
      json['date'] as String,
      json['product_id'] as int,
      json['account_id'] as int,
      json['movement_type'] as String,
    );

Map<String, dynamic> _$MovementToJson(Movement instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'archive': instance.archive,
      'comment': instance.comment,
      'date': instance.date,
      'product_id': instance.productId,
      'account_id': instance.accountId,
      'movement_type': instance.movementType,
    };
