
import '../../../../../lib_imports.dart';
import '../../bloc/movie/search/search_movies_cubit.dart';
import 'build_search_movies.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Expanded(
            child: Center(
              child: Text(AppStrings.searchMovies),
            ),
          ),
          loaded: (movies) {
            return movies.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(AppStrings.noMovieFound),
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
              child: Text(AppStrings.noMovieFound),
            ),
          ),
        );
      },
    );
  }
}
