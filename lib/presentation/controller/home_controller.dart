

import 'package:flutter_movie_db/data/model/movie_type.dart';
import 'package:flutter_movie_db/data/repository/i_movie_repository.dart';
import 'package:flutter_movie_db/data/result.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:flutter_movie_db/presentation/base/base_state.dart';
import 'package:flutter_movie_db/presentation/controller/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeController extends BaseController<HomeState> {
  HomeController(this.movieRepository) : super(HomeState());

  final IMovieRepository movieRepository;
  late String movieId;

  @override
  Future<Result> loadData() async {
    final movieResponse = await movieRepository.getMovieList(MovieType.POPULAR);

    print('hoan.dv: movie response are ${movieResponse.length} item');

    final HomeState clone = state.copyWith(viewState: ViewState.Loaded);
    state = clone;

    return Success();
  }
}
