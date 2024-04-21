
import '../../../../../core/widgets/category_items.dart';
import '../../../../../lib_imports.dart';
class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryItems(
          screen: Routes.moviesFavorite,
          title: AppStrings.movie,
          icon: Icons.movie,
          color: Colors.red,
        ),
        CategoryItems(
          screen: Routes.tvFavorite,
          title: AppStrings.tv,
          icon: Icons.tv,
          color: Colors.green,
        ),
      ],
    );
  }
}
