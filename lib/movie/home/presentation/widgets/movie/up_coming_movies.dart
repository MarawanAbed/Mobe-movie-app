import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/build_item_images.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/row_view_all.dart';

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
