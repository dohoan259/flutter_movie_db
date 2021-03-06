// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/error_handler.dart' as _i10;
import '../common/error_listener.dart' as _i11;
import '../data/repository/i_movie_repository.dart' as _i7;
import '../data/repository/movie_repo.dart' as _i8;
import '../data/repository/remote/interceptor/logging_interceptor.dart' as _i13;
import '../data/repository/remote/service/api_service.dart' as _i6;
import '../data/repository/remote/source/app_movie_remote_source.dart' as _i5;
import '../data/repository/remote/source/movie_remote_source.dart' as _i4;
import '../presentation/controller/home_controller.dart' as _i9;
import '../presentation/controller/login_controller.dart' as _i3;
import 'network_model.dart' as _i14;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.LoginController>(() => _i3.LoginController());
  gh.factory<String>(() => networkModule.apiKey, instanceName: 'api_key');
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'base_url');
  gh.factory<String>(() => networkModule.posterUrl, instanceName: 'poster_url');
  gh.factory<_i4.MovieRemoteSource>(
      () => _i5.AppMovieRemoteSource(get<_i6.ApiService>()),
      registerFor: {_dev, _prod});
  gh.factory<_i7.IMovieRepository>(
      () => _i8.MovieRepository(get<_i4.MovieRemoteSource>()));
  gh.factory<_i9.HomeController>(
      () => _i9.HomeController(get<_i7.IMovieRepository>()));
  gh.singleton<_i10.ErrorHandler>(_i10.ErrorHandler());
  gh.singleton<_i11.ErrorListener>(_i11.ErrorListener());
  gh.singleton<_i12.Interceptor>(_i13.LoggingInterceptor(),
      instanceName: 'logging_interceptor');
  gh.singleton<_i12.Interceptor>(networkModule.getApiKeyInterceptor(),
      instanceName: 'api_key_interceptor');
  gh.singleton<_i12.Dio>(networkModule.getDio(
      get<_i12.Interceptor>(instanceName: 'api_key_interceptor'),
      get<_i12.Interceptor>(instanceName: 'logging_interceptor')));
  gh.singleton<_i6.ApiService>(networkModule.getService(get<_i12.Dio>()));
  return get;
}

class _$NetworkModule extends _i14.NetworkModule {}
