

import '../../../../../lib_imports.dart';
import '../../bloc/movie/similar/similar_movies_cubit.dart';

class SimilarMoviesBlocBuilder extends StatefulWidget {
  const SimilarMoviesBlocBuilder({super.key, required this.id});

  final int id;

  @override
  State<SimilarMoviesBlocBuilder> createState() =>
      _SimilarMoviesBlocBuilderState();
}

class _SimilarMoviesBlocBuilderState extends State<SimilarMoviesBlocBuilder> {
  @override
  void initState() {
    context.read<SimilarMoviesCubit>().getSimilarMovies(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
      buildWhen: (previous, current) =>
      current is Loading ||
          current is Loaded ||
          current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) {
            return BuildItemImages(
              screen: Routes.movieDetails,
              movies: movies,
            );
          },
          error: (error) => const Text(AppStrings.noDataFound),
        );
      },
    );
  }
}