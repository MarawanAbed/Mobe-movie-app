

import 'package:movie_app/mobe/presentation/widgets/movie/popular_list_view.dart';

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
            Navigators.pushNamed(Routes.popularViewAll, arguments: {
              'title': AppStrings.popular,
            });
          },
        ),
        HelperMethod.verticalSpace(20),
        PopularListView(movies: movies,),
      ],
    );
  }
}
