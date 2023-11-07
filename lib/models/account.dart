import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final bool archive;
  final String id, firstname, lastname, matricule, role;

  Account(this.firstname, this.lastname, this.matricule, this.archive, this.id,
      this.role);

  /// Connect the generated [_$AccountFromJson] function to the `fromJson`
  /// factory.
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  /// Connect the generated [_$AccountToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
