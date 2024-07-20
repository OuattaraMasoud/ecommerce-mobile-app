import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey()
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  List<String>? role;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson(data) => _$UserModelToJson(this);
}
