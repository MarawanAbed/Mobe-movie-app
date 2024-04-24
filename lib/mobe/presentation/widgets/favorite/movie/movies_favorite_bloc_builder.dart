import '../../../../../../lib_imports.dart';
import '../build_favorites_items.dart';

class MoviesFavorite extends StatelessWidget {
  const MoviesFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<FavoriteModel>(AppStrings.favoriteMovie).listenable(),
      builder: (context, Box<FavoriteModel> box, _) {
        List<FavoriteModel> favorites = box.values.toList();
        return favorites.isEmpty
            ? const Center(child: Text(AppStrings.noFavoritesYet))
            : BuildFavoritesItems(
                isMovie: true,
                movies: favorites,
              );
      },
    );
  }
}
