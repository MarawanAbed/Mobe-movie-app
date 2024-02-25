import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/category/category_items.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryItems(
          isMovie: true,
          title: 'Movie',
          icon: Icons.movie,
          color: Colors.red,
        ),
        CategoryItems(
          isMovie: false,
          title: 'Tv',
          icon: Icons.tv,
          color: Colors.green,
        ),
      ],
    );
  }
}
