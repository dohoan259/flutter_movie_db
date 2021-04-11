// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return MovieListResponse(
    json['page'] as int,
    (json['results'] as List)
        .map((e) => GeneralMovie.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['total_pages'] as int,
    json['total_results'] as int,
  );
}

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
