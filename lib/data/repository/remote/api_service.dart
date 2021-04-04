

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/model/item_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "http://api.themoviedb.org/3/movie")
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/popular")
  Future<ItemModel> fetchPopularMovie();
}