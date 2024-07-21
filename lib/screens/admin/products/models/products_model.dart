import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? productId;
  String productName;
  String imagesUrl;
  String productDescription;
  double productPrice;
  String? subCategoryId;
  DateTime productCreatedAt;
  DateTime productUpdatedAt;

  ProductModel({
    this.productId,
    required this.productName,
    required this.imagesUrl,
    required this.productDescription,
    required this.productPrice,
    this.subCategoryId,
    required this.productCreatedAt,
    required this.productUpdatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
