
import '../../../../../lib_imports.dart';

class UpComingMovies extends StatelessWidget {
  const UpComingMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title:AppStrings.upcoming,
          onTap: () {
            Navigators.pushNamed(Routes.viewAll, arguments: {
              'title': AppStrings.upcoming,
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
