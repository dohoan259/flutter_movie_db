import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/error_entity.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorHandler {
  ErrorEntity handleError(error, stackTrace) {
    if (error is Exception) {
      try {
        late ErrorEntity networkException;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.CANCEL:
              networkException = RequestCancelledException();
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              networkException = RequestTimeoutException();
              break;
            case DioErrorType.DEFAULT:
              networkException = NetworkException();
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              networkException = SendTimeoutException();
              break;
            case DioErrorType.RESPONSE:
              switch (error.response.statusCode) {
                case 400:
                case 401:
                case 403:
                  networkException =
                      UnauthorisedException(error.response.statusMessage);
                  break;
                case 404:
                  networkException = NotFoundException();
                  break;
                case 409:
                  networkException = ConflictException();
                  break;
                case 408:
                  networkException = RequestTimeoutException();
                  break;
                case 500:
                  networkException = ServerInternalException();
                  break;
                case 503:
                  networkException = ServiceUnavailableException();
                  break;
                default:
                  networkException = DefaultException(
                      'received invalid code : ${error.response.statusCode}');
                  break;
              }
              break;
            case DioErrorType.SEND_TIMEOUT:
              networkException = SendTimeoutException();
              break;
          }
        } else if (error is SocketException) {
          networkException = NetworkException();
        } else {
          networkException = UnexpectedException();
        }
        return networkException;
      } on FormatException catch (e) {
        return FormatException(e.message);
      } catch (_) {
        return UnexpectedException();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return UnableToProcess(error.toString());
      } else {
        return UnexpectedException();
      }
    }
  }
}
