// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      json['id'] as String?,
      json['brands'] as String?,
      (json['carbon_footprint_percent_of_known_ingredients'] as num?)
          ?.toDouble(),
      json['conservation_conditions_fr'] as String?,
      json['image_url'] as String?,
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['labels'] as String?,
      json['product_name_fr'] as String?,
      json['nutriscore_grade'] as String?,
      json['origins'] as String?,
      json['quantity'] as String?,
      json['stores'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'brands': instance.brands,
      'carbon_footprint_percent_of_known_ingredients': instance.carbonFootprint,
      'conservation_conditions_fr': instance.conservation,
      'product_name_fr': instance.name,
      'image_url': instance.imageUrl,
      'ingredients': instance.ingredients,
      'labels': instance.labels,
      'nutriscore_grade': instance.nutriscore,
      'origins': instance.origins,
      'quantity': instance.quantity,
      'stores': instance.stores,
    };
