import 'package:e_commerce_project/screens/admin/subcategories/model/subcategory_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String? id;
  String name;
  String createdAt;
  String updatedAt;
  List<SubCategoryModel> subCategories;

  CategoryModel({
    this.id,
    required this.subCategories,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
