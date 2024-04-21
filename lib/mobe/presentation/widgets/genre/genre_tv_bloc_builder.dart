

import '../../../../../lib_imports.dart';
import '../../bloc/tv/genre/get_tv_genres_cubit.dart';
import 'build_genre_items.dart';

class GenreTvBlocBuilder extends StatelessWidget {
  const GenreTvBlocBuilder({super.key, required this.isMovie});

  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvGenresCubit, GetTvGenresState>(
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
