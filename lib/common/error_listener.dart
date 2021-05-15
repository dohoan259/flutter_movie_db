import 'package:flutter/material.dart';
import 'package:flutter_movie_db/data/error_entity.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:flutter_movie_db/presentation/base/base_state.dart';
import 'package:flutter_movie_db/presentation/ui/screens/error/unknown_error_page.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@singleton
class ErrorListener {
  Widget handleError<C extends BaseController, T extends BaseState>(
      BuildContext context, ErrorEntity? error) {
    if (context.read<T>().viewState == ViewState.Uninitialized) {
      // show a dialog
    }
    return UnknownErrorPage<C>(
      message: error?.message,
    );
  }
}
