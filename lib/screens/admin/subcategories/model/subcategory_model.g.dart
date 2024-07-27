// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) =>
    SubCategoryModel(
      subCategoryId: json['subCategoryId'] as String?,
      subCategoryName: json['subCategoryName'] as String,
      subCategoryCreatedAt: json['subCategoryCreatedAt'] as String,
      subCategoryUpdatedAt: json['subCategoryUpdatedAt'] as String,
    );

Map<String, dynamic> _$SubCategoryModelToJson(SubCategoryModel instance) =>
    <String, dynamic>{
      'subCategoryId': instance.subCategoryId,
      'subCategoryName': instance.subCategoryName,
      'subCategoryCreatedAt': instance.subCategoryCreatedAt,
      'subCategoryUpdatedAt': instance.subCategoryUpdatedAt,
    };
