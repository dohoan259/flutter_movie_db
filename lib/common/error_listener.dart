import 'package:flutter/material.dart';
import 'package:flutter_movie_db/data/error_entity.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:flutter_movie_db/presentation/ui/screens/error/unknown_error_page.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorListener {
  Widget handleError<C extends BaseController>(ErrorEntity error) {
    //todo: handle error:

    return UnknownErrorPage<C>(
      message: error.message,
    );
  }
}