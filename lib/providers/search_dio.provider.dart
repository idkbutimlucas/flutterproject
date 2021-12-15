import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/models/food.dart';
import 'package:iut2021/providers/dio.dart';

final searchDioProvider = FutureProvider<Food?>((ref) async {
  final Dio dio = ref.read(dioProvider);
  String? element;
  final String URLWithoutNutriscore =
      '&tagtype_0=origins&tag_contains_0=contains&tag_0=France&tagtype_1=ingredients&tag_contains_1=contains&tag_1=' +
          element! +
          '&fields=id,brands,carbon_footprint_percent_of_known_ingredients,conservation_conditions_fr,product_name_fr,image_url,ingredients,labels,nutriscore_grade,origins,quantity,stores';
  try {
    final Response response = await dio.get(URLWithoutNutriscore);
    return Food.fromJson(response.data);
  } catch (e) {
    return Future.error(e);
  }
});
