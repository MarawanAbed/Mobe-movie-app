import 'package:flutter/material.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/image_items.dart';

class BuildType extends StatelessWidget {
  const BuildType({super.key, required this.isMovie, this.tv,this.movies});
  final bool isMovie;
  final List<TvModel>?tv;
  final List<MovieModel>?movies;
  @override
  Widget build(BuildContext context) {
    const image=ApiConstant.imageBaseUrl;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ImageItems(
        image:  isMovie?image+movies![index].posterPath: image+tv![index].posterPath,
        screen: isMovie ? Routes.movieDetails: Routes.tvDetails,
      ),
      itemCount: isMovie? movies!.length: tv!.length,
    );
  }
}
