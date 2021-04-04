

import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:injectable/injectable.dart';

mixin MovieRemoteSource {
  Future<List<GeneralMovie>> fetchPopularMovie();
}
