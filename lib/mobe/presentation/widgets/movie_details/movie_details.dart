import 'package:movie_app/mobe/presentation/widgets/movie_details/similar_movies_bloc_builder.dart';

import '../../../../../lib_imports.dart';
import '../../../../core/themes/styles.dart';
import '../../../../core/utils/sizes.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movies,
  });

  final MovieDetailsModel movies;

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
            movies.title ?? 'No Title',
            style: TextStyles.kTextFont24Bold,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Row(
            children: [
              InfoItems(
                releaseDate: movies.releaseDate ?? 'No Date',
                voteAverage: movies.voteAverage ?? 0.0,
              ),
              const SizedBox(
                width: AppSizes.kDefaultWidth20,
              ),
              Text(
                HelperMethod.showDuration(movies.runTime ?? 0),
                style: TextStyles.font16NormalGrey,
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            movies.overview ?? 'No Overview',
            style: TextStyles.font16NormalGrey,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            '${AppStrings.genre} : ${HelperMethod.showGenres(movies.genres ?? [])}',
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
          SimilarMoviesBlocConsumer(id: movies.id ?? 0),
        ],
      ),
    );
  }
}
