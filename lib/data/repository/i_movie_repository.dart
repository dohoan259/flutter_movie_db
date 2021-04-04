import 'package:flutter_movie_db/data/model/movie_type.dart';
import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';

mixin IMovieRepository {
  Future<List<GeneralMovie>> getMovieList(MovieType movieType);
}