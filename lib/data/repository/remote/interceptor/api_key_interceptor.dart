// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class ApiKeyInterceptor extends Interceptor {
  @factoryMethod
  ApiKeyInterceptor(this.apiKey);

  final String apiKey;

  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey('authenticate')) {
      options.headers.remove('authenticate');
      options.queryParameters['api_key'] = apiKey;
    }

    return options;
  }
}
