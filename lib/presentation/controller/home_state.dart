import 'package:flutter_movie_db/presentation/base/base_state.dart';

class HomeState extends BaseState {
  HomeState() : super();

  int count = 0;

  @override
  HomeState copyWith({viewState, processing, count}) {
    var newState = HomeState();
    newState.viewState = viewState ?? this.viewState;
    newState.processing = processing ?? this.processing;
    newState.count = count ?? this.count;

    return newState;
  }
}