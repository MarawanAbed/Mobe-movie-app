

import '../../../../../lib_imports.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title: AppStrings.popular,
          onTap: () {
            Navigators.pushNamed(Routes.viewAll, arguments: {
              'title': AppStrings.popular,
              'movies': movies,
              'isMovie': true,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        BuildItemImages(
          movies: movies,
          screen: Routes.movieDetails,
        ),
      ],
    );
  }
}
