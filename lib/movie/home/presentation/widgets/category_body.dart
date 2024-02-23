import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryItem(
          title: 'Movie',
          icon: Icons.movie,
          color: Colors.red,
        ),
        CategoryItem(
          title: 'Tv',
          icon: Icons.tv,
          color: Colors.green,
        ),
      ],
    );
  }
}


class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigators.pushNamed(Routes.genreScreen, arguments: title);
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}