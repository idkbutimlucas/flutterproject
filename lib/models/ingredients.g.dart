// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      json['id'] as String?,
      json['percent_estimate'] as Object?,
      json['text'] as String?,
      json['vegan'] as String?,
      json['vegetarian'] as String?,
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'id': instance.id,
      'percent_estimate': instance.percent,
      'text': instance.text,
      'vegan': instance.vegan,
      'vegetarian': instance.vegetarian,
    };
