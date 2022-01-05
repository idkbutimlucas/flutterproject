import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/models/food.dart';
import 'package:iut2021/providers/dio.dart';
import 'package:iut2021/widgets/routes/product_page/product_page.dart';

final searchDioProvider = FutureProvider<Food?>((ref) async {
  final Dio dio = ref.read(dioProvider);

  String? element = "banane";
  String? nutriscore = "b";
  String additives = "indifferent";
  String palmOil = "indifferent";

  String urlWithoutNutriscore =
      '&tagtype_0=origins&tag_contains_0=contains&tag_0=France&tagtype_1=ingredients&tag_contains_1=contains&tag_1=' +
          element +
          '&additives=' +
          additives +
          '&ingredients_from_palm_oil=' +
          palmOil +
          '&fields=id,brands,carbon_footprint_percent_of_known_ingredients,conservation_conditions_fr,product_name_fr,image_url,ingredients,labels,nutriscore_grade,origins,quantity,stores';

  String urlWithNutriscore =
      '&tagtype_0=origins&tag_contains_0=contains&tag_0=France&tagtype_1=nutrition_grades&tag_contains_1=contains&tag_1=' +
          nutriscore +
          '&tagtype_2=ingredients&tag_contains_2=contains&tag_2=' +
          element +
          '&additives=' +
          additives +
          '&ingredients_from_palm_oil=' +
          palmOil +
          '&fields=id,brands,carbon_footprint_percent_of_known_ingredients,conservation_conditions_fr,product_name_fr,image_url,ingredients,labels,nutriscore_grade,origins,quantity,stores';

  String url = "";

  // ignore: unnecessary_null_comparison
  if (nutriscore != null) {
    url = urlWithNutriscore;
  } else {
    url = urlWithoutNutriscore;
  }
  try {
    final Response response = await dio.get(url);
    return Food.fromJson(response.data);
  } catch (e) {
    print(e.toString());
    return Future.error(e);
  }
});
