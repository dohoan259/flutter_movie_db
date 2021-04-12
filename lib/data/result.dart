import 'error_entity.dart';

abstract class Resource<T> with _Resource<T> {
  const factory Resource.success({required T data}) = Success<T>;
  const factory Resource.error({required ErrorEntity error}) = Failure<T>;
}

mixin _Resource<T> {
  Result when<Result extends Object>({
    required Result success(T data),
    required Result failure(ErrorEntity error),
  });

  Result map<Result extends Object>({
    required Result success(Success<T> value),
    required Result failure(Failure<T> value),
  });
}

class _Success<T> implements Success<T> {
  const _Success({required this.data}) : assert(data != null);

  @override
  final T data;

  @override
  String toString() {
    return 'Resource<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<T> && (identical(other.data, data)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ data.hashCode;

  @override
  Result when<Result extends Object>({
    required Result success(T data),
    required Result failure(ErrorEntity error),
  }) {
    return success(data);
  }

  @override
  Result map<Result extends Object>({
    required Result success(Success<T> value),
    required Result failure(Failure<T> value),
  }) {
    return success(this);
  }
}

abstract class Success<T> implements Resource<T> {
  const factory Success({required T data}) = _Success<T>;

  T get data;
}

class _Failure<T> implements Failure<T> {
  const _Failure({required this.error});

  @override
  final ErrorEntity error;

  @override
  String toString() {
    return 'Resource<$T>.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure<T> && (identical(other.error, error)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ error.hashCode;

  @override
  Result when<Result extends Object>({
    required Result success(T data),
    required Result failure(ErrorEntity error),
  }) {
    return failure(error);
  }

  @override
  Result map<Result extends Object>({
    required Result success(Success<T> value),
    required Result failure(Failure<T> value),
  }) {
    return failure(this);
  }
}

abstract class Failure<T> implements Resource<T> {
  const factory Failure({required ErrorEntity error}) = _Failure<T>;

  ErrorEntity get error;
}
