

import 'package:movie_app/mobe/presentation/widgets/movie/top_rated_movies.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/movie/top_rated/get_top_rated_movies_cubit.dart';

class TopRatedBlocBuilder extends StatelessWidget {
  const TopRatedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopRatedMoviesCubit, GetTopRatedMoviesState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) {
            return TopRatedMovies(
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
