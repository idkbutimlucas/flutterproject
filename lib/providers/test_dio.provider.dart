import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/models/food.dart';
import 'package:iut2021/providers/dio.dart';

final testDioProvider = FutureProvider<Food?>((ref) async {
  final Dio dio = ref.read(dioProvider);
  try {
    final Response response = await dio.get(
        '&tagtype_0=origins&tag_contains_0=contains&tag_0=France&tagtype_1=nutrition_grades&tag_contains_1=contains&tag_1=A&tagtype_2=ingredients&tag_contains_2=contains&tag_2=banane&fields=id,brands,carbon_footprint_percent_of_known_ingredients,conservation_conditions_fr,product_name_fr,image_url,ingredients,labels,nutriscore_grade,origins,quantity,stores');
    return Food.fromJson(response.data);
  } catch (e) {
    return Future.error(e);
  }
});
