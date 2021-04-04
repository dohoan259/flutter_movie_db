import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  final int page;
  final List<GeneralMovie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  MovieListResponse(
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  );

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
