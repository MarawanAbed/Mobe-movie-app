import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/widgets/tv_details/tv_details.dart';
import 'package:movie_app/mobe/presentation/widgets/tv_details/tv_poster.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../lib_imports.dart';
import '../../../../core/widgets/back_drop_image.dart';

class TvDetailsItems extends StatelessWidget {
  const TvDetailsItems({
    super.key,
    required this.tv,
  });

  final TvDetailsModel tv;

  @override
  Widget build(BuildContext context) {
    const image = ApiConstant.imageBaseUrl;
    return Stack(
      children: [
        BackDropImage(image: image, tv: tv,isMovie: false,),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  favorite: FavoriteModel(
                    id: tv.id!,
                    title: tv.name!,
                    voteAverage: tv.voteAverage,
                    posterPath: tv.posterPath?? AppImages.placeholder,
                    releaseDate: tv.firstAirDate!,
                    overview: tv.overview!,
                    isMovie: false,
                  ),
                ),
                const SizedBox(
                  height:AppSizes.kDefaultHeight60,
                ),
                TvPoster(
                  tv: tv,
                ),
                const SizedBox(
                  height: AppSizes.kDefaultHeight20,
                ),
                TvDetails(
                  tv: tv,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

