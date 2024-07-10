import 'package:movie_app/mobe/presentation/widgets/movie_details/similar_list_view.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/widgets/no_data.dart';
import '../../bloc/movie/similar/similar_movies_cubit.dart';

class SimilarMoviesBlocConsumer extends StatefulWidget {
  const SimilarMoviesBlocConsumer({super.key, required this.id});

  final int id;

  @override
  State<SimilarMoviesBlocConsumer> createState() =>
      _SimilarMoviesBlocConsumerState();
}

class _SimilarMoviesBlocConsumerState extends State<SimilarMoviesBlocConsumer> {
  @override
  void initState() {
    context.read<SimilarMoviesCubit>().getSimilarMovies(widget.id);
    super.initState();
  }

  final List<MovieModel>allMovies = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarMoviesCubit, SimilarMoviesState>(
      buildWhen: (previous, current) =>
      current is Loading ||
          current is Loaded ||
          current is Error ||
          current is PaginationLoading,
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
          loading: () => const Center(child: CircularProgressIndicator()),
          paginationLoading: ()=> SimilarListView(movies: allMovies, id: widget.id),
          loaded: (movies) {
            return movies.isEmpty
                ? const NoDataWidget()
                :SimilarListView(movies: allMovies, id: widget.id);
          },
          error: (error) => const NoDataWidget(),
        );
      },
    );
  }
}