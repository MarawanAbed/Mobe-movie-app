import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/search/search_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/search_movie/build_search_movies.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Expanded(
            child: Center(
              child: Text('Search for Movies'),
            ),
          ),
          loaded: (movies) {
            return movies.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text('No Movies Found'),
                    ),
                  )
                : Expanded(
                    child: BuildSearchMovies(
                      movies: movies,
                    ),
                  );
          },
          error: (message) => const Expanded(
            child: Center(
              child: Text('No Movies Found'),
            ),
          ),
        );
      },
    );
  }
}
