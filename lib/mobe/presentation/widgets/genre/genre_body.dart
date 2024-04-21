

import '../../../../../lib_imports.dart';
import 'genre_movie_bloc_builder.dart';
import 'genre_tv_bloc_builder.dart';

class GenreBody extends StatelessWidget {
  const GenreBody({super.key, required this.title, required this.isMovie});

  final String title;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            isMovie
                ? GenreMoviesBlocBuilder(
                    isMovie: isMovie,
                  )
                : GenreTvBlocBuilder(
                    isMovie: isMovie,
                  ),
          ],
        ),
      ),
    );
  }
}
