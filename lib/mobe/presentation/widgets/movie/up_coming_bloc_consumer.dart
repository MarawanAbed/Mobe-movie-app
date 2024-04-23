import 'package:movie_app/mobe/presentation/widgets/movie/up_coming_movies.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/movie/upcoming/get_up_coming_movies_cubit.dart';

class UpComingBlocConsumer extends StatelessWidget {
  const UpComingBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var allMovies = context.read<GetUpComingMoviesCubit>().allMovies;
    return BlocConsumer<GetUpComingMoviesCubit, GetUpComingMoviesState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Loaded || current is Error|| current is PaginationLoading,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (movies) {
            allMovies.addAll(movies);
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          paginationLoading: ()=> UpComingMovies(
            movies: allMovies,
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) {
            return UpComingMovies(
              movies: allMovies,
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


