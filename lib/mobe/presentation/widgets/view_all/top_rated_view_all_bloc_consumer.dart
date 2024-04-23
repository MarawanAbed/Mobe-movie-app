import 'package:movie_app/mobe/presentation/bloc/movie/view_all/get_top_rated_view_all_movies_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/top_rated_view_all_body.dart';

import '../../../../lib_imports.dart';

class TopRatedViewAllBlocConsumer extends StatelessWidget {
  const TopRatedViewAllBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetTopRatedViewAllMoviesCubit>().allMovies;
    return BlocConsumer<GetTopRatedViewAllMoviesCubit,
        GetTopRatedViewAllMoviesState>(
      buildWhen: (previous, current) =>
          current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
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
          paginationLoading: ()=> TopRatedViewAllBody(
            movies: cubit,
          ),
          loaded: (movies) {
            return TopRatedViewAllBody(
              movies: cubit,
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
