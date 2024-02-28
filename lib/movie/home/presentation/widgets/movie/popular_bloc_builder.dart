import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/popular/get_popular_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie/popular_movies.dart';

class PopularBlocBuilder extends StatelessWidget {
  const PopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) {
            return PopularMovies(
              movies: movies,
            );
          },
          error: (error) => Center(
            child: Text(error),
          ),
        );
      },
    );
  }
}
