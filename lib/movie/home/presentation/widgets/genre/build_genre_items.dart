import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/data/models/genres_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/genre/genre_item.dart';

class BuildGenreItems extends StatelessWidget {
  const BuildGenreItems({
    super.key,
    required this.isMovie,
    required this.genres,
  });

  final List<GenresModel> genres;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GenreItem(
          title: genres[index].name,
          isMovie: isMovie,
          id: genres[index].id,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: genres.length,
    );
  }
}
