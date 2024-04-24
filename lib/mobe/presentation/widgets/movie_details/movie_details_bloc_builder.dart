import 'package:movie_app/core/widgets/no_data.dart';

import '../../../../../lib_imports.dart';
import '../../bloc/movie/details/get_movie_details_cubit.dart';
import 'movies_details_items.dart';

class MovieDetailsBlocBuilder extends StatefulWidget {
  const MovieDetailsBlocBuilder({super.key, required this.id});

  final int id;

  @override
  State<MovieDetailsBlocBuilder> createState() =>
      _MovieDetailsBlocBuilderState();
}

class _MovieDetailsBlocBuilderState extends State<MovieDetailsBlocBuilder> {
  @override
  void initState() {
    context.read<GetMovieDetailsCubit>().getMovieDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieDetailsCubit, GetMovieDetailsState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (movie) {
              if (movie != null) {
                return MoviesDetailsItems(movies: movie);
              } else {
                return const NoDataWidget();
              }
            },
            error: (error) => const NoDataWidget());
      },
    );
  }
}
