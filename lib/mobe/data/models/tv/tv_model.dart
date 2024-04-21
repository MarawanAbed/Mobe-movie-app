
import 'package:json_annotation/json_annotation.dart';

part 'tv_model.g.dart';
@JsonSerializable()
class TvModel{
  final int? id;
  final String? name;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;


  TvModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.firstAirDate,
  }) ;

  factory TvModel.fromJson(Map<String, dynamic> json) => _$TvModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvModelToJson(this);
}