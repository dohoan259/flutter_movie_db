

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/repository/remote/model/response/movie_list_response.dart';
import 'package:injectable/injectable.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class ApiService {

  factory ApiService(Dio dio) = _ApiService;


  @GET("/movie/popular")
  // @Headers(<String, dynamic>{
  //   "Content-Type" : "application/json",
  //   "authenticate" : true
  // })
  Future<MovieListResponse> fetchPopularMovies();
}