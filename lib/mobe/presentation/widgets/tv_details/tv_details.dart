import 'package:movie_app/core/themes/styles.dart';
import 'package:movie_app/core/utils/sizes.dart';
import 'package:movie_app/mobe/presentation/widgets/tv_details/similar_tv_bloc_consumer.dart';

import '../../../../../lib_imports.dart';

class TvDetails extends StatefulWidget {
  const TvDetails({super.key, required this.tv});

  final TvDetailsModel tv;

  @override
  State<TvDetails> createState() => _TvDetailsState();
}

class _TvDetailsState extends State<TvDetails> {
  List<GenresModel> noGenre = [GenresModel(id: 0, name: 'No Genre')];
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
            widget.tv.name?? 'No Title',
            style: TextStyles.kTextFont24Bold,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            '${AppStrings.season}:${widget.tv.numberOfSeasons}  ${AppStrings.episodes}:${widget.tv.numberOfEpisodes}',
            style: TextStyles.font16NormalGrey,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          InfoItems(
            releaseDate: widget.tv.firstAirDate?? 'No Date',
            voteAverage: widget.tv.voteAverage?? 0.0,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            widget.tv.overview!.isEmpty?'No Overview':widget.tv.overview!,
            style: TextStyles.font16NormalGrey,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight10,
          ),
          Text(
            '${AppStrings.genre} : ${HelperMethod.showGenres(widget.tv.genres??noGenre)}',
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
          SimilarTvBlocConsumer(id: widget.tv.id!),
        ],
      ),
    );
  }
}


