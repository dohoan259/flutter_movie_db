import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/error_entity.dart';

ErrorEntity? getDioException(error) {
  if (error is Exception) {
    try {
      ErrorEntity? networkException;
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.CANCEL:
            networkException = NetworkException();
            break;
          case DioErrorType.CONNECT_TIMEOUT:
            networkException = NetworkException();
            break;
          case DioErrorType.DEFAULT:
            networkException = NetworkException();
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            networkException = NetworkException();
            break;
          case DioErrorType.RESPONSE:
            switch (error.response.statusCode) {
              case 400:
              case 401:
              case 403:
                networkException = UnauthorisedException(error.response.statusMessage);
                break;
              case 404:
                networkException = NotFoundException();
                break;
              case 409:
                //todo: conflict
                break;
              case 408:
                //todo: request timeout
                break;
              case 500:
                // todo: internal server error
                break;
              case 503:
                //todo: service unavailable
                break;
              default:
                //todo: default error
                break;
            }
            break;
          case DioErrorType.SEND_TIMEOUT:
            //todo: send time out
            break;
        }
      } else if (error is SocketException) {
        networkException = NetworkException();
      } else {
        // unexpected error
      }
      return networkException;
    } on FormatException catch (e) {
      // format exception
    } catch (_) {
      // todo: unexpected error
    }
  } else {
    if (error.toString().contains('is not a subtype of')) {
      // todo: unable to process
    } else{
      //todo: unexpected error
    }
  }
}