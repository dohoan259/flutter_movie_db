import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:injectable/injectable.dart';

import '../service/api_service.dart';
import 'movie_remote_source.dart';

@Injectable(as: MovieRemoteSource)
class AppMovieRemoteSource implements MovieRemoteSource {
  AppMovieRemoteSource(this.apiService);

  final ApiService apiService;

  @override
  Future<List<GeneralMovie>> fetchPopularMovie() async {

      final movieResponse = await apiService.fetchPopularMovies();
      return movieResponse.results;
  }
}
