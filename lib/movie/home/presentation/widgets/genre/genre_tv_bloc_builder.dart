import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/genre/get_tv_genres_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/genre/build_genre_items.dart';

class GenreTvBlocBuilder extends StatelessWidget {
  const GenreTvBlocBuilder({super.key, required this.isMovie});

  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvGenresCubit, GetTvGenresState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (genres) {
            return BuildGenreItems(
              genres: genres,
              isMovie: isMovie,
            );
          },
          error: (message) => Text(message),
        );
      },
    );
  }
}
