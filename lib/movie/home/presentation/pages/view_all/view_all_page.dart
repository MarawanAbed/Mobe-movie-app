import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/view_all/view_all_body.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key, required this.title, required this.isMovie, this.movies, this.tv});

  final String title;
  final bool isMovie;
  final List<MovieModel>?movies;
  final List<TvModel>?tv;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundNavBar,
        appBar: AppBar(
          title: Text('$title ${isMovie ? AppStrings.movie : AppStrings.tv}'),
        ),
        body: ViewAllBody(
          isMovie: isMovie,
          movies: movies,
          tv: tv,
        ),
      ),
    );
  }
}
