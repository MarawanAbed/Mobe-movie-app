import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CategoryItems({
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