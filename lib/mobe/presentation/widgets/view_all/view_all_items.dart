import 'package:movie_app/core/utils/sizes.dart';

import '../../../../core/themes/styles.dart';
import '../../../../lib_imports.dart';

class ViewAllItems extends StatelessWidget {
  const ViewAllItems({
    super.key,
    required this.isMovie,
    this.tv,
    this.movie,
    required this.screen,
    this.arguments,
  });

  final bool isMovie;
  final TvModel? tv;
  final MovieModel? movie;
  final String screen;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(screen, arguments: arguments);
      },
      child: Container(
        padding: const EdgeInsets.all(AppSizes.kDefaultPadding10),
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          color: AppColors.kBackGround,
          borderRadius: BorderRadius.circular(AppSizes.kDefaultRadius10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(isMovie: isMovie, tv: tv, movie: movie),
            const SizedBox(
              width: AppSizes.kDefaultWidth20,
            ),
            DetailsContainer(isMovie: isMovie, tv: tv, movie: movie),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final bool isMovie;
  final TvModel? tv;
  final MovieModel? movie;

  const ImageContainer({
    super.key,
    required this.isMovie,
    this.tv,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    const images = ApiConstant.imageBaseUrl;
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.kDefaultPadding10),
        child: CachedNetworkImage(
          imageUrl: isMovie
              ? '$images${movie!.posterPath}'
              : '$images${tv!.posterPath}',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.24,
        ),
      ),
    );
  }
}

class DetailsContainer extends StatelessWidget {
  final bool isMovie;
  final TvModel? tv;
  final MovieModel? movie;

  const DetailsContainer({
    super.key,
    required this.isMovie,
    this.tv,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isMovie ? movie!.title! : tv!.name ?? 'no name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font20Bold,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight15,
          ),
          InfoItems(
            releaseDate:
                isMovie ? movie!.releaseDate! : tv!.firstAirDate ?? 'no date',
            voteAverage: isMovie ? movie!.voteAverage! : tv!.voteAverage ?? 0.0,
          ),
          const SizedBox(
            height: AppSizes.kDefaultHeight15,
          ),
          Expanded(
            child: Text(
              isMovie ? movie!.overview! : tv!.overview ?? 'no overview',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font16NormalGrey,
            ),
          ),
        ],
      ),
    );
  }
}
