

import 'package:movie_app/mobe/presentation/widgets/movie/popular_movies.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/movie/popular/get_popular_movies_cubit.dart';

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
