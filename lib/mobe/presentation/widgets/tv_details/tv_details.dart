import 'package:movie_app/core/themes/styles.dart';
import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/widgets/tv_details/similar_tv_bloc_consumer.dart';

import '../../../../../lib_imports.dart';

class TvDetails extends StatelessWidget {
  const TvDetails({super.key, required this.tv});

  final TvDetailsModel tv;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.kDefaultPadding10,
        horizontal: AppSizes.kDefaultPadding20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tv.name!,
            style: TextStyles.kTextFont24Bold,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            '${AppStrings.season}:${tv.numberOfSeasons}  ${AppStrings.episodes}:${tv.numberOfEpisodes}',
            style: TextStyles.font16NormalGrey,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          InfoItems(
            releaseDate: tv.firstAirDate!,
            voteAverage: tv.voteAverage!,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            tv.overview!,
            style: TextStyles.font16NormalGrey,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            '${AppStrings.genre} : ${HelperMethod.showGenres(tv.genres!)}',
            style: TextStyles.font16NormalGrey.copyWith(
              color: Colors.white54,
            ),
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight20,
          ),
          Text(
            AppStrings.moreLikeThis,
            style: TextStyles.font20Bold,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight20,
          ),
          SimilarTvBlocConsumer(id: tv.id!),
        ],
      ),
    );
  }
}


