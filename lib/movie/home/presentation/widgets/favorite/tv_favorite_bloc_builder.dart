import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/movie/home/presentation/widgets/favorite/build_favorites_items.dart';

class TvFavorite extends StatelessWidget {
  const TvFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<FavoriteModel>(AppStrings.favoriteTv).listenable(),
      builder: (context, Box<FavoriteModel> box, _) {
        List<FavoriteModel> favorites = box.values.toList();
        List<FavoriteModel> tv =
            favorites.where((favorite) => !favorite.isMovie).toList();
        return favorites.isEmpty
            ? const Center(child: Text(AppStrings.noFavoritesYet))
            : BuildFavoritesItems(
                isMovie: false,
                tv: tv,
              );
      },
    );
  }
}

