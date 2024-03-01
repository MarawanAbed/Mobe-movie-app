import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/presentation/widgets/commmon/category_items.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryItems(
          title: AppStrings.movie,
          icon: Icons.movie,
          color: Colors.red,
          screen: Routes.genre,
          arguments:  {
            'title': AppStrings.movie,
            'isMovie': true,
          }),
        CategoryItems(
          title: AppStrings.tv,
          icon: Icons.tv,
          screen: Routes.genre,
          arguments:  {
            'title': AppStrings.tv,
            'isMovie': false,
          },
          color: Colors.green,
        ),
      ],
    );
  }
}
