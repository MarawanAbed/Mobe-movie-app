import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/assets/images.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/custom_app_bar.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_details.dart';
import 'package:movie_app/movie/home/presentation/widgets/tv_details/tv_poster.dart';
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
        Opacity(
          opacity: 0.4,
          child: FadeInImage(
            placeholder: const AssetImage(AppImages.placeholder),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            imageErrorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  AppImages.errorSvg,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.33,
                ),
              );
            },

            image: CachedNetworkImageProvider(image + tv.backdropPath),
            fit: BoxFit.contain,
          ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  favorite: FavoriteModel(
                    id: tv.id,
                    title: tv.name,
                    voteAverage: tv.voteAverage,
                    posterPath: tv.posterPath,
                    releaseDate: tv.firstAirDate,
                    overview: tv.overview,
                    isMovie: false,
                  ),
                ),
                HelperMethod.verticalSpace(60),
                TvPoster(
                  tv: tv,
                ),
                HelperMethod.verticalSpace(30),
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
