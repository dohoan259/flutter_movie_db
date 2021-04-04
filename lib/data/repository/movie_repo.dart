import 'package:flutter_movie_db/data/model/movie_type.dart';
import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:flutter_movie_db/data/repository/remote/source/movie_remote_source.dart';
import 'package:injectable/injectable.dart';

import 'i_movie_repository.dart';

@Injectable(as: IMovieRepository)
class MovieRepository implements IMovieRepository {

  MovieRepository(this.remoteSource);

  final MovieRemoteSource remoteSource;

  @override
  Future<List<GeneralMovie>> getMovieList(MovieType movieType) {
    switch (movieType) {
      case MovieType.POPULAR:
        return remoteSource.fetchPopularMovie();
      default:
        return remoteSource.fetchPopularMovie();
    }
  }
}
