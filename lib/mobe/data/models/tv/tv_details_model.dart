import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/mobe/data/models/genres/genres_model.dart';

part 'tv_details_model.g.dart';
@JsonSerializable()
class TvDetailsModel
{
  final int? id;
  final String? name;

  final String? overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  final List<GenresModel>?genres;
  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;

  @JsonKey(name: 'number_of_episodes')

  final int? numberOfEpisodes;


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
    required this.numberOfEpisodes,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => _$TvDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailsModelToJson(this);
}