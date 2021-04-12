// ignore: must_be_immutable
import 'package:flutter_movie_db/data/error_entity.dart';

abstract class BaseState {
  ViewState viewState = ViewState.Uninitialized;
  bool processing = false;
  ErrorEntity? error;
  BaseState copyWith();
}

enum ViewState { Uninitialized, Loaded, Error }
