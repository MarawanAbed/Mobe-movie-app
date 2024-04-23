
import 'package:movie_app/mobe/presentation/widgets/tv_details/similar_tv_bloc_consumer.dart';

import '../../../../../lib_imports.dart';

class TvDetails extends StatelessWidget {
  const TvDetails({super.key, required this.tv});
  final TvDetailsModel tv;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            tv.name!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Text(
            '${AppStrings.season}:${tv.numberOfSeasons}  ${AppStrings.episodes}:${tv.numberOfEpisodes}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Row(
            children: [
              InfoItems(
                releaseDate: tv.firstAirDate!,
                voteAverage: tv.voteAverage!,
              ),
              HelperMethod.horizontalSpace(20),
            ],
          ),
          HelperMethod.verticalSpace(10),
          Text(
            tv.overview!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          HelperMethod.verticalSpace(10),
          Text(
            '${AppStrings.genre} : ${HelperMethod.showGenres(tv.genres!)}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          HelperMethod.verticalSpace(20),
          const Text(
            AppStrings.moreLikeThis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          HelperMethod.verticalSpace(10),
          SimilarTvBlocConsumer(id: tv.id!),
        ],
      ),
    );
  }
}
