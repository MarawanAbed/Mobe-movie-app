import 'package:flutter/material.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/view_all/view_all_items.dart';

class ViewAllBody extends StatelessWidget {
  const ViewAllBody({super.key, required this.isMovie, this.tv, this.movies});

  final bool isMovie;
  final List<TvModel>?tv;
  final List<MovieModel>?movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ViewAllItems(
          screen: isMovie ? Routes.movieDetails : Routes.tvDetails,
          arguments: isMovie ? movies![index].id : tv![index].id,
          isMovie: isMovie,
          movie: isMovie ? movies![index] : null,
          tv: isMovie ? null : tv![index],
        ),
        separatorBuilder: (context, index) => HelperMethod.verticalSpace(20),
        itemCount: isMovie ? movies!.length : tv!.length,
      ),
    );
  }
}
