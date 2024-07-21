import 'package:json_annotation/json_annotation.dart';

part 'subcategory_model.g.dart';

@JsonSerializable()
class SubCategoryModel {
  String? id;
  String name;
  String createdAt;
  String updatedAt;

  SubCategoryModel({
    this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
