import 'package:json_annotation/json_annotation.dart';

import 'user_builder_model.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  DateTime? createdAt;
  String? email;
  String? id;
  String? lastname;
  String? name;

  UserModel({
    this.email,
    this.id,
    this.lastname,
    this.name,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserModelBuilder get builder => UserModelBuilder();
}
