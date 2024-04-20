import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/upcoming/get_up_coming_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie/up_coming_movies.dart';

class UpComingBlocBuilder extends StatelessWidget {
  const UpComingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUpComingMoviesCubit, GetUpComingMoviesState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) {
            return UpComingMovies(
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
