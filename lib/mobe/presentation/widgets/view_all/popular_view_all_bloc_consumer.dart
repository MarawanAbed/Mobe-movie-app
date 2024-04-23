import 'package:movie_app/mobe/presentation/bloc/movie/view_all/get_popular_view_all_movies_cubit.dart';
import 'package:movie_app/mobe/presentation/widgets/view_all/popular_view_all_body.dart';

import '../../../../lib_imports.dart';

class PopularViewAllBlocConsumer extends StatelessWidget {
  const PopularViewAllBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetPopularViewAllMoviesCubit>().allMovies;
    return BlocConsumer<GetPopularViewAllMoviesCubit,
        GetPopularViewAllMoviesState>(
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
          paginationLoading: ()=> PopularViewAllBody(
            movies: cubit,
          ),
          loaded: (movies) {
            return PopularViewAllBody(
              movies: cubit,
            );
          },
          error: (error) => Center(
            child: Text(error),
          )
        );
      },
    );
  }
}
