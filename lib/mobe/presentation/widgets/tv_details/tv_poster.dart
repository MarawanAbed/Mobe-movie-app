import 'package:movie_app/core/widgets/play_icon.dart';
import 'package:movie_app/core/widgets/poster_image.dart';

import '../../../../../lib_imports.dart';

class TvPoster extends StatelessWidget {
  const TvPoster({super.key, required this.tv});

  final TvDetailsModel tv;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PosterImage(image: image, tv: tv),
          PlayIcon(
            tv: tv,
            isMovie: false,
          ),
        ],
      ),
    );
  }
}
