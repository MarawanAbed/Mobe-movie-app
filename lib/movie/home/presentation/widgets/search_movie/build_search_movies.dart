import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/image_items.dart';

class BuildSearchMovies extends StatelessWidget {
  const BuildSearchMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ImageItems(
        image: image + (movies[index].posterPath??AppImages.placeholder),
        screen: Routes.movieDetails,
        arguments: movies[index].id,
      ),
      itemCount: movies.length,
    );
  }
}
