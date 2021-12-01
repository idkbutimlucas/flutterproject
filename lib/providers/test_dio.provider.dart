import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/models/food.dart';
import 'package:iut2021/providers/dio.dart';

final testDioProvider = FutureProvider<Food?>((ref) async{
  final Dio dio = ref.read(dioProvider);
  try{
    final Response response = await dio.get('&tagtype_0=origins&tag_contains_0=contains&tag_0=France&tagtype_1=nutrition_grades&tag_contains_1=contains&tag_1=A&tagtype_2=ingredients&tag_contains_2=contains&tag_2=banane&tagtype_3=ingredients&tag_contains_3=contains&tag_3=fraise&fields=generic_name');
    return Food.fromJson(response.data);
  }catch(e){
    return Future.error(e);
  }
});