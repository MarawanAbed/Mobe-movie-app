import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/core/widgets/play_icon.dart';
import 'package:movie_app/core/widgets/poster_image.dart';

import '../../../../../lib_imports.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.movies});

  final MovieDetailsModel movies;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.kDefaultPadding10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PosterImage(image: image, movie: movies),
          PlayIcon(
            movie: movies,
            isMovie: true,
          ),
        ],
      ),
    );
  }
}
