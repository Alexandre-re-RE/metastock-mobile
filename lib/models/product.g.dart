// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['archive'] as bool,
      json['id'] as int,
      json['stock'] as int,
      json['description'] as String?,
      json['name'] as String?,
      json['picture'] as String?,
      (json['unitPrice'] as num?)?.toDouble(),
      json['threshold'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'stock': instance.stock,
      'threshold': instance.threshold,
      'archive': instance.archive,
      'description': instance.description,
      'name': instance.name,
      'picture': instance.picture,
      'unitPrice': instance.unitprice,
    };
