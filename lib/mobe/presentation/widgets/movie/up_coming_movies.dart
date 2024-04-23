import 'package:movie_app/mobe/presentation/widgets/movie/up_coming_list_view.dart';

import '../../../../../lib_imports.dart';

class UpComingMovies extends StatelessWidget {
  const UpComingMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title: AppStrings.upcoming,
          onTap: () {
            Navigators.pushNamed(Routes.upComingViewAll, arguments: {
              'title': AppStrings.upcoming,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        UpComingListView(
          movies: movies,
        ),
      ],
    );
  }
}
