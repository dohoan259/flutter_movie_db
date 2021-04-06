// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/repository/remote/interceptor/api_key_interceptor.dart';
import 'package:flutter_movie_db/data/repository/remote/interceptor/logging_interceptor.dart';
import 'package:flutter_movie_db/data/repository/remote/service/api_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('api_key')
  String get apiKey => 'cfaa4f1968a583e934d1968fc2bb6744';

  // @Named('api_key_interceptor')
  // @singleton
  // Interceptor getApiKeyInterceptor(@Named('api_key') String apiKey) =>
  //     ApiKeyInterceptor(apiKey);

  @Named('api_key_interceptor')
  @singleton
  Interceptor getApiKeyInterceptor() => ApiKeyInterceptor(apiKey);

  @Named('base_url')
  String get baseUrl => "https://api.themoviedb.org/3";

  @Named('poster_url')
  String get posterUrl => 'https://image.tmdb.org/t/p/original';

  @singleton
  Dio getDio(@Named('api_key_interceptor') Interceptor apiKeyInterceptor,
      @Named('logging_interceptor') Interceptor loggingInterceptor) {
    final dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        baseUrl: baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    )..interceptors.add(apiKeyInterceptor);
    //todo: if debug mode, add logging interceptor
    dio.interceptors.add(loggingInterceptor);

    return dio;
  }

  @singleton
  ApiService getService(Dio dio) => ApiService(dio);
}
