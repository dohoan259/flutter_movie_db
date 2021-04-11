import 'error_entity.dart';

class Resource<T> {

  T? data;
  ErrorEntity? error;

  Resource.success(this.data);
  Resource.error(this.error);
}