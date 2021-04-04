// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/movie_repo.dart' as _i4;
import '../data/repository/repo1.dart' as _i5;
import '../data/repository/repo2.dart' as _i6;
import '../presentation/controller/home_controller.dart' as _i7;
import 'network_model.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Dio>(() => networkModule.dio);
  gh.factory<_i4.MovieRepository>(() => _i4.MovieRepository());
  gh.factory<_i5.Repo1>(() => _i5.Repo1());
  gh.factory<_i6.Repo2>(() => _i6.Repo2());
  gh.factory<_i7.HomeController>(
      () => _i7.HomeController(movieRepository: get<_i4.MovieRepository>()));
  return get;
}

class _$NetworkModule extends _i8.NetworkModule {}
