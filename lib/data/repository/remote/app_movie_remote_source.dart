import 'package:flutter_movie_db/data/model/item_model.dart';
import 'package:flutter_movie_db/data/repository/remote/movie_remote_source.dart';

import 'api_service.dart';

class AppMovieRemoteSource implements MovieRemoteSource {
  AppMovieRemoteSource(this.apiService);

  final ApiService apiService;

  // ignore: non_constant_identifier_names
  final API_KEY = "cfaa4f1968a583e934d1968fc2bb6744";

  @override
  Future<ItemModel> fetchPopularMovie() async {

      final movieResponse = await apiService.fetchPopularMovie();

      return movieResponse;
  }
}
