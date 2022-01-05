import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: "https://fr.openfoodfacts.org/cgi/search.pl?action=process&json=1",
    connectTimeout: 5000,
    receiveTimeout: 5000,
    sendTimeout: 5000));

final dioProvider = Provider<Dio>((ref) {
  return dio;
});
