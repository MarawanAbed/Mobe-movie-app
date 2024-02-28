// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvModel _$TvModelFromJson(Map<String, dynamic> json) => TvModel(
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      voteAverage: json['vote_average'] as double,
      firstAirDate: json['first_air_date'] as String,
    );

Map<String, dynamic> _$TvModelToJson(TvModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'first_air_date': instance.firstAirDate,
    };
