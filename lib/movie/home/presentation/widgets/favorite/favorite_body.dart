import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/category_items.dart';

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
