// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvDetailsModel _$TvDetailsModelFromJson(Map<String, dynamic> json) =>
    TvDetailsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfSeasons: json['number_of_seasons'] as int?,
      numberOfEpisodes: json['number_of_episodes'] as int?,
    );

Map<String, dynamic> _$TvDetailsModelToJson(TvDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'vote_average': instance.voteAverage,
      'genres': instance.genres,
      'number_of_seasons': instance.numberOfSeasons,
      'number_of_episodes': instance.numberOfEpisodes,
    };
