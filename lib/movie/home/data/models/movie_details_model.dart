
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/movie/home/data/models/genres_model.dart';

part 'movie_details_model.g.dart';
@JsonSerializable()
class MovieDetailsModel{
  final int id;
  @JsonKey(name: 'original_title')
  final String title;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'runtime')
  final int runTime;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  final List<GenresModel>genres;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.runTime,
    required this.voteAverage,
    required this.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);

}
