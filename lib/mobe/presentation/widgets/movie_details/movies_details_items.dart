import 'package:movie_app/core/utils/sizes.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../lib_imports.dart';
import '../../../../core/widgets/back_drop_image.dart';
import 'movie_details.dart';
import 'movie_poster.dart';

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
        BackDropImage(
          image: image,
          movie: movies,
          isMovie: true,
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  favorite: FavoriteModel(
                    id: movies.id!,
                    title: movies.title!,
                    voteAverage: movies.voteAverage,
                    posterPath: movies.posterPath?? AppImages.placeholder,
                    releaseDate: movies.releaseDate!,
                    overview: movies.overview!,
                    isMovie: true,
                  ),
                ),
                const SizedBox(
                  height:AppSizes.kDefaultHeight60,
                ),
                MoviePoster(movies: movies),
                const SizedBox(
                  height: AppSizes.kDefaultHeight30,
                ),
                MovieDetails(movies: movies),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
