// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralMovie _$GeneralMovieFromJson(Map<String, dynamic> json) {
  return GeneralMovie(
    voteCount: json['vote_count'] as int,
    id: json['id'] as int,
    video: json['video'] as bool,
    voteAverage: (json['vote_average'] as num).toDouble(),
    title: json['title'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    posterPath: json['poster_path'] as String,
    originalLanguage: json['original_language'] as String,
    backdropPath: json['backdrop_path'] as String,
    adult: json['adult'] as bool,
    overview: json['overview'] as String,
    releaseDate: json['release_date'] as String,
    originalTitle: json['original_title'] as String,
  );
}

Map<String, dynamic> _$GeneralMovieToJson(GeneralMovie instance) =>
    <String, dynamic>{
      'vote_count': instance.voteCount,
      'id': instance.id,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
    };
