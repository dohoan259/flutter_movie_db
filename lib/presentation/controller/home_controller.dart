

import 'package:flutter_movie_db/data/repository/movie_repo.dart';
import 'package:flutter_movie_db/data/repository/repo1.dart';
import 'package:flutter_movie_db/data/repository/repo2.dart';
import 'package:flutter_movie_db/data/result.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:flutter_movie_db/presentation/base/base_state.dart';
import 'package:flutter_movie_db/presentation/controller/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeController extends BaseController<HomeState> {
  HomeController({required this.movieRepository}) : super(HomeState());

  final MovieRepository movieRepository;
  late String movieId;

  @override
  Future<Result> loadData() async {
    print('hoan.dv: movieId: $movieId');

    final HomeState clone = state.copyWith(viewState: ViewState.Loaded);
    state = clone;

    return Success();
  }
}
