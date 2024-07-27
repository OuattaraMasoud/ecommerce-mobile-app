// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String,
      categoryCreatedAt: json['categoryCreatedAt'] as String,
      categoryUpdatedAt: json['categoryUpdatedAt'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryCreatedAt': instance.categoryCreatedAt,
      'categoryUpdatedAt': instance.categoryUpdatedAt,
    };
