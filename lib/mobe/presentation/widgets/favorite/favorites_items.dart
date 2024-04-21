
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
                child: FadeInImage(
                  image:CachedNetworkImageProvider( images + favorite.posterPath),
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height * 0.25,
                  placeholder: const AssetImage(AppImages.placeholder),
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
                    favorite.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  HelperMethod.verticalSpace(10),
                  ReleaseDate(
                    releaseDate: favorite.releaseDate,
                  ),
                  HelperMethod.verticalSpace(10),
                  Expanded(
                    child: Text(
                      favorite.overview,
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
