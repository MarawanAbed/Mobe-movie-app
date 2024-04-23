import 'package:movie_app/mobe/presentation/widgets/movie/top_rated_movies.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/movie/top_rated/get_top_rated_movies_cubit.dart';

class TopRatedBlocBuilder extends StatelessWidget {
  const TopRatedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetTopRatedMoviesCubit>().allMovies;

    return BlocConsumer<GetTopRatedMoviesCubit, GetTopRatedMoviesState>(
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
          paginationLoading: ()=> TopRatedMovies(
            movies: cubit,
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) {
            return TopRatedMovies(
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
