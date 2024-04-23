import 'package:movie_app/mobe/presentation/widgets/movie/top_rated_list_view.dart';

import '../../../../../lib_imports.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title: AppStrings.topRated,
          onTap: () {
            Navigators.pushNamed(Routes.topRatedViewAll, arguments: {
              'title': AppStrings.topRated,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        TopRatedListView(
          movies: movies,
        ),
      ],
    );
  }
}
