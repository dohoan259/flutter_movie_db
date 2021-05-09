import 'package:flutter_movie_db/presentation/base/base_state.dart';

class AuthState extends BaseState {
  AuthState() : super();

  bool isLogin = false;

  @override
  AuthState copyWith({viewState, processing, isLogin, popularMovies, error}) {
    var newState = AuthState();
    newState.viewState = viewState ?? this.viewState;
    newState.processing = processing ?? this.processing;
    newState.isLogin = isLogin ?? this.isLogin;
    newState.error = error ?? this.error;

    return newState;
  }
}