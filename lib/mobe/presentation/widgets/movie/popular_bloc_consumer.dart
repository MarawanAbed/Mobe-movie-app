import 'package:movie_app/mobe/presentation/widgets/movie/popular_movies.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/movie/popular/get_popular_movies_cubit.dart';

class PopularBlocConsumer extends StatelessWidget {
  const PopularBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetPopularMoviesCubit>().allMovies;
    return BlocConsumer<GetPopularMoviesCubit, GetPopularMoviesState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Loaded || current is Error || current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (movies) {
            cubit.addAll(movies);
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          paginationLoading: ()=> PopularMovies(
            movies: cubit,
          ),
          loaded: (movies) {
            return PopularMovies(
              movies: cubit,
            );
          },
          error: (error) =>
              Center(
                child: Text(error),
              ),
        );
      },

    );
  }
}
