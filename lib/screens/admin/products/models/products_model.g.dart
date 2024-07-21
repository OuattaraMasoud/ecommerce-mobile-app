// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: json['productId'] as String?,
      productName: json['productName'] as String,
      imagesUrl: json['imagesUrl'] as String,
      productDescription: json['productDescription'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      subCategoryId: json['subCategoryId'] as String?,
      productCreatedAt: DateTime.parse(json['productCreatedAt'] as String),
      productUpdatedAt: DateTime.parse(json['productUpdatedAt'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'imagesUrl': instance.imagesUrl,
      'productDescription': instance.productDescription,
      'productPrice': instance.productPrice,
      'subCategoryId': instance.subCategoryId,
      'productCreatedAt': instance.productCreatedAt.toIso8601String(),
      'productUpdatedAt': instance.productUpdatedAt.toIso8601String(),
    };
