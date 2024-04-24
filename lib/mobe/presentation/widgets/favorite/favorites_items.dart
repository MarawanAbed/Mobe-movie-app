import 'package:movie_app/core/themes/styles.dart';
import 'package:movie_app/core/utils/sizes.dart';

import '../../../../../lib_imports.dart';

class FavoritesItems extends StatelessWidget {
  const FavoritesItems(
      {super.key,
      required this.favorite,
      required this.screen,
      this.arguments});

  final FavoriteModel favorite;
  final String screen;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    const images = ApiConstant.imageBaseUrl;
    return GestureDetector(
      onTap: () {
        Navigators.pushNamed(screen, arguments: arguments);
      },
      child: Container(
        padding: const EdgeInsets.all(AppSizes.kDefaultPadding10),
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
                borderRadius: BorderRadius.circular(AppSizes.kDefaultRadius10),
                child: CachedNetworkImage(
                  imageUrl: '$images${favorite.posterPath}',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.24,
                ),
              ),
            ),
            const SizedBox(
              width: AppSizes.kDefaultWidth15
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favorite.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font20Bold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.kDefaultHeight15,
                  ),
                  ReleaseDate(
                    releaseDate: favorite.releaseDate,
                  ),
                  const SizedBox(
                    height: AppSizes.kDefaultHeight15,
                  ),
                  Expanded(
                    child: Text(
                      favorite.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font16NormalGrey,
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
