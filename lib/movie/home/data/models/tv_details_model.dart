import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/movie/home/data/models/genres_model.dart';

part 'tv_details_model.g.dart';
@JsonSerializable()
class TvDetailsModel
{
  final int id;
  final String name;

  final String overview;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'first_air_date')
  final String firstAirDate;

  @JsonKey(name: 'vote_average')
  final String voteAverage;

  final List<GenresModel>genres;
  @JsonKey(name: 'number_of_seasons')
  final int numberOfSeasons;


  TvDetailsModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.genres,
    required this.numberOfSeasons,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => _$TvDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsModelToJson(this);
}