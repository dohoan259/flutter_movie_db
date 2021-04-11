import 'package:flutter/material.dart';
import 'package:flutter_movie_db/data/error_entity.dart';
import 'package:flutter_movie_db/presentation/ui/screens/error/unknown_error_page.dart';

class ErrorListener {
  ErrorListener._privateConstructor();

  static final ErrorListener _instance = ErrorListener._privateConstructor();

  static ErrorListener get instance { return _instance;}

  Widget handleError(ErrorEntity error) {
    //todo: handle error:
    return UnknownErrorPage();
  }
}