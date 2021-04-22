import 'error_entity.dart';

class Resource<T> {
  final T? data;
  final ErrorEntity? error;

  Resource({this.data, this.error});
}

class Success<T> extends Resource<T> {
  Success(T data) : super(data: data);
}

class Failure<T> extends Resource<T> {
  Failure(ErrorEntity error) : super(error: error, data: null);
}
