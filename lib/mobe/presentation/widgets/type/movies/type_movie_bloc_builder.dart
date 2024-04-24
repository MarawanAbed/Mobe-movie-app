import 'package:movie_app/mobe/presentation/widgets/type/movies/movie_grid_view.dart';

import '../../../../../../lib_imports.dart';
import '../../../Bloc/movie/by_genre/get_movies_by_genre_cubit.dart';

class TypeMovieBlocBuilder extends StatefulWidget {
  const TypeMovieBlocBuilder(
      {super.key, required this.id});

  final int id;

  @override
  State<TypeMovieBlocBuilder> createState() => _TypeMovieBlocBuilderState();
}

class _TypeMovieBlocBuilderState extends State<TypeMovieBlocBuilder> {
  @override
  void initState() {
    context.read<GetMoviesByGenreCubit>().getMoviesByGenre(
          widget.id,
        );
    super.initState();
  }

  List<MovieModel> allMovies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMoviesByGenreCubit, GetMoviesByGenreState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (movies) {
            allMovies.addAll(movies);
          },
        );
      },
      builder: (context, state) {
        return BlocBuilder<GetMoviesByGenreCubit, GetMoviesByGenreState>(
          builder: (context, state) {
            return state.when(
              paginationLoading: () => TypeMovieGridView(
                id: widget.id,
                movies: allMovies,
              ),
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (movies) => TypeMovieGridView(
                id: widget.id,
                movies: allMovies,
              ),
              error: (message) => Text(message),
            );
          },
        );
      },
    );
  }
}
