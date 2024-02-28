import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/build_item_images.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/services/navigator.dart';
import '../commmon/row_view_all.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowViewAll(
          title: 'Popular ',
          onTap: () {
            Navigators.pushNamed(Routes.viewAll, arguments: {
              'title': 'Popular',
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
