// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';
part 'general_movie.g.dart';

@JsonSerializable()
class GeneralMovie {
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final int id;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  final String title;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds = [];
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  final bool adult;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;

  GeneralMovie({
    required this.voteCount,
    required this.id,
    required this.video,
    required this.voteAverage,
    required this.title,
    required this.popularity,
    required this.posterPath,
    required this.originalLanguage,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.originalTitle,
  });

  factory GeneralMovie.fromJson(Map<String, dynamic> json) => _$GeneralMovieFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralMovieToJson(this);
}
