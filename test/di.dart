import 'package:flutter_movie_db/di/di.config.dart';
import 'package:flutter_movie_db/utils/config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(generateForDir: ['test'])
void configureDependencies() => $initGetIt(getIt, environment: Env.test);