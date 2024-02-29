
import 'package:json_annotation/json_annotation.dart';

part 'movie_vidoes.g.dart';
@JsonSerializable()
class VideosModel {
  final int id;
  final List<Results> results;

  VideosModel({
    required this.id,
    required this.results,
  });

  factory VideosModel.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class Results {
  final String id;
  final String iso_639_1;
  final String iso_3166_1;
  final String key;
  final String name;
  final String site;
  final int size;
  final bool official;
  @JsonKey(name: 'published_at')
  final String publishedAt;
  final String type;

  Results({
    required this.id,
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}