
import '../../../../../lib_imports.dart';
import '../../bloc/movie/genre/get_movie_genres_cubit.dart';
import 'build_genre_items.dart';

class GenreMoviesBlocBuilder extends StatelessWidget {
  const GenreMoviesBlocBuilder({super.key, required this.isMovie});

  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieGenresCubit, GetMovieGenresState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (genres) {
            return BuildGenreItems(
              genres: genres,
              isMovie: isMovie,
            );
          },
          error: (message) => Text(message),
        );
      },
    );
  }
}
