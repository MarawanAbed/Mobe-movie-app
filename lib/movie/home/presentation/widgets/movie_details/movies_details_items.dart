import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';
import 'package:movie_app/movie/home/data/models/movie_details_model.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/custom_app_bar.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/movie_details.dart';
import 'package:movie_app/movie/home/presentation/widgets/movie_details/movie_poster.dart';

import '../../../../../core/networking/api_constant.dart';

class MoviesDetailsItems extends StatelessWidget {
  const MoviesDetailsItems({
    super.key,
    required this.movies,
  });

  final MovieDetailsModel movies;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: FadeInImage(
            placeholder: const AssetImage(AppImages.placeholder),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            image: CachedNetworkImageProvider(image + (movies.backdropPath??AppImages.placeholder)),
            fit: BoxFit.contain,
          ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  favorite: FavoriteModel(
                    id: movies.id,
                    title: movies.title,
                    voteAverage: movies.voteAverage,
                    posterPath: movies.posterPath,
                    releaseDate: movies.releaseDate,
                    overview: movies.overview,
                    isMovie: true,
                  ),
                ),
                HelperMethod.verticalSpace(60),
                MoviePoster(movies: movies),
                HelperMethod.verticalSpace(30),
                MovieDetails(movies: movies),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
