import 'package:flutter_movie_db/data/error_entity.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:flutter_movie_db/presentation/base/base_state.dart';
import 'package:flutter_movie_db/presentation/controller/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginController extends BaseController<AuthState> {
  LoginController() : super(AuthState());

  @override
  Future<ErrorEntity?> loadData() async {
    final AuthState newState = state.copyWith(
      viewState: ViewState.Loaded,
      isLogin: false,
      error: null,
    );
    state = newState;

    return null;
  }

  Future<ErrorEntity?> login() async {
    final AuthState newState = state.copyWith(
      isLogin: true,
      error: null,
    );
    state = newState;
    return null;
  }
}
