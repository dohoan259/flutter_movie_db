import 'package:flutter_movie_db/data/model/movie_type.dart';
import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:flutter_movie_db/data/result.dart';

abstract class IMovieRepository {
  Future<Resource<List<GeneralMovie>>> getMovieList(MovieType movieType);
}