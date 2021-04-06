import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';
import 'package:flutter_movie_db/presentation/base/base_state.dart';

class HomeState extends BaseState {
  HomeState() : super();

  int count = 0;
  List<GeneralMovie> popularMovies = [];

  @override
  HomeState copyWith({viewState, processing, count, popularMovies}) {
    var newState = HomeState();
    newState.viewState = viewState ?? this.viewState;
    newState.processing = processing ?? this.processing;
    newState.count = count ?? this.count;
    newState.popularMovies = popularMovies ?? [];

    return newState;
  }
}