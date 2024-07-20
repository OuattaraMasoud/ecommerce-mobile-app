import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String name;
  String description;
  double price;
  String? subCategoryId;
  DateTime createdAt;
  DateTime updatedAt;

  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    this.subCategoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
