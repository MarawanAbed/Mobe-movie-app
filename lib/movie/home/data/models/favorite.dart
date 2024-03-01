import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final String releaseDate;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final bool isMovie;
  @HiveField(6)
  final num? voteAverage;


  FavoriteModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview,
    required this.isMovie,
    required this.voteAverage,
  });


}
