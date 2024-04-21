

import '../../../../lib_imports.dart';

class ViewAllItems extends StatelessWidget {
  const ViewAllItems({
    super.key,
    required this.isMovie,
    this.tv,
    this.movie, required this.screen, this.arguments,
  });

  final bool isMovie;
  final TvModel? tv;
  final MovieModel? movie;
  final String screen;
  final dynamic arguments;
  @override
  Widget build(BuildContext context) {
    const images = ApiConstant.imageBaseUrl;
    return GestureDetector(
      onTap: ()
      {
        Navigators.pushNamed(screen,arguments: arguments);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          color: AppColors.kBackGround,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: isMovie
                      ? '$images${movie!.posterPath}'
                      : '$images${tv!.posterPath}',
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
            ),
            HelperMethod.horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isMovie ? movie!.title! : tv!.name??'no name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  HelperMethod.verticalSpace(10),
                  InfoItems(
                    releaseDate: isMovie ? movie!.releaseDate! : tv!.firstAirDate??'no date',
                    voteAverage: isMovie ? movie!.voteAverage! : tv!.voteAverage??0.0,
                  ),
                  HelperMethod.verticalSpace(10),
                  Expanded(
                    child: Text(
                      isMovie ? movie!.overview! : tv!.overview??'no overview',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
