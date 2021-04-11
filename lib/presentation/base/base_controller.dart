import 'package:flutter_movie_db/data/result.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:state_notifier/state_notifier.dart';

import 'base_state.dart';

abstract class BaseController<T extends BaseState> extends StateNotifier<T>
    with LocatorMixin {
  BaseController(T state) : super(state) {
    loadData();
  }

  Future<bool> loadData();

  Future<void> reload() async {
    BaseState clone = state.copyWith();
    clone.viewState = ViewState.Uninitialized;
    state = clone as T;
    initState();
  }
}
