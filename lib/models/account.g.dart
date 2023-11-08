// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['firstname'] as String?,
      json['lastname'] as String?,
      json['matricule'] as String?,
      json['archive'] as bool,
      json['id'] as String,
      json['role'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'archive': instance.archive,
      'role': instance.role,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'matricule': instance.matricule,
    };
