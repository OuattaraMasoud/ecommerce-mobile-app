import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String? categoryId;
  String categoryName;
  String categoryCreatedAt;
  String categoryUpdatedAt;

  CategoryModel({
    this.categoryId,
    required this.categoryName,
    required this.categoryCreatedAt,
    required this.categoryUpdatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
