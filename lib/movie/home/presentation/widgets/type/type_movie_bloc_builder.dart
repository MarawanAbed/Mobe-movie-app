import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/by_genre/get_movies_by_genre_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/type/build_type.dart';

class TypeMovieBlocBuilder extends StatefulWidget {
  const TypeMovieBlocBuilder(
      {super.key, required this.isMovie, required this.id});

  final bool isMovie;
  final int id;

  @override
  State<TypeMovieBlocBuilder> createState() => _TypeMovieBlocBuilderState();
}

class _TypeMovieBlocBuilderState extends State<TypeMovieBlocBuilder> {
  @override
  void initState() {
    context.read<GetMoviesByGenreCubit>().getMoviesByGenre(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesByGenreCubit, GetMoviesByGenreState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () =>
              const Center(child: CircularProgressIndicator()),
          loading: () =>
              const Center(child: CircularProgressIndicator()),
          loaded: (movies) => BuildType(
            isMovie: widget.isMovie,
            movies: movies,
          ),
          error: (message) => Text(message),
        );
      },
    );
  }
}
