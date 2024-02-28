import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/type/type_movie_bloc_builder.dart';
import 'package:movie_app/movie/home/presentation/widgets/type/type_tv_bloc_builder.dart';

class TypeBody extends StatelessWidget {
  const TypeBody({super.key, required this.isMovie, required this.id});

  final bool isMovie;
  final int id;

  @override
  Widget build(BuildContext context) {
    return isMovie
        ? TypeMovieBlocBuilder(isMovie: isMovie, id: id)
        : TypeTvBlocBuilder(isMovie: isMovie, id: id);
  }
}
