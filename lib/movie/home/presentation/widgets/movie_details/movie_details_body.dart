import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/movie_details_bloc_builder.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return MovieDetailsBlocBuilder(
      id: id,
    );
  }
}
