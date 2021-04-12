import 'package:flutter_movie_db/data/model/movie_type.dart';
import 'package:flutter_movie_db/data/repository/i_movie_repository.dart';
import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:flutter_movie_db/data/result.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:flutter_movie_db/presentation/base/base_state.dart';
import 'package:flutter_movie_db/presentation/controller/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeController extends BaseController<HomeState> {
  HomeController(this.movieRepository) : super(HomeState());

  final IMovieRepository movieRepository;

  @override
  Future<bool> loadData() async {
    Resource<List<GeneralMovie>> resourceMovie =
        await movieRepository.getMovieList(MovieType.POPULAR);

    final result = resourceMovie.when(success: (List<GeneralMovie> data) {
      final HomeState clone =
          state.copyWith(viewState: ViewState.Loaded, popularMovies: data);
      state = clone;
      return true;
    }, failure: (error) {
      final HomeState clone =
          state.copyWith(viewState: ViewState.Error, popularMovies: null, error: error);
      state = clone;
      return false;
    });

    return result;
  }
}
