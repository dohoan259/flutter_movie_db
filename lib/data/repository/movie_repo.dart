import 'package:flutter_movie_db/data/error_entity.dart';
import 'package:flutter_movie_db/data/model/movie_type.dart';
import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:flutter_movie_db/data/repository/remote/source/movie_remote_source.dart';
import 'package:flutter_movie_db/data/result.dart';
import 'package:injectable/injectable.dart';

import 'i_movie_repository.dart';

@Injectable(as: IMovieRepository)
class MovieRepository implements IMovieRepository {

  MovieRepository(this.remoteSource);

  final MovieRemoteSource remoteSource;

  @override
  Future<Resource<List<GeneralMovie>>> getMovieList(MovieType movieType) async {
    var data;
    try {
      switch (movieType) {
        case MovieType.POPULAR:
          data = await remoteSource.fetchPopularMovie();
          break;
        default:
          data = await remoteSource.fetchPopularMovie();
          break;
      }
      return Resource.success(data);
    } catch (e) {
      return Resource.error(getDioException(e)!);
    }
  }
}
