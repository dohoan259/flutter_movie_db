import 'error_entity.dart';

abstract class Result {}

class Success extends Result {

  Success({this.data});

  final dynamic data;
}

class ErrorResult extends Result {

  ErrorResult({required this.errorEntity});

  final ErrorEntity errorEntity;
}