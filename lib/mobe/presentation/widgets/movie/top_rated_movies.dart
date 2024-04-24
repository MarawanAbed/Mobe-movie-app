import 'package:movie_app/mobe/presentation/widgets/movie/top_rated_list_view.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/utils/sizes.dart';

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
        const SizedBox(
          height: AppSizes.kDefaultHeight20,
        ),
        TopRatedListView(
          movies: movies,
        ),
      ],
    );
  }
}
