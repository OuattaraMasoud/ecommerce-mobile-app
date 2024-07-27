import 'package:json_annotation/json_annotation.dart';

part 'subcategory_model.g.dart';

@JsonSerializable()
class SubCategoryModel {
  String? subCategoryId;
  String subCategoryName;
  String subCategoryCreatedAt;
  String subCategoryUpdatedAt;

  SubCategoryModel({
    this.subCategoryId,
    required this.subCategoryName,
    required this.subCategoryCreatedAt,
    required this.subCategoryUpdatedAt,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
