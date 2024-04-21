import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';

class GenreItem extends StatelessWidget {
  const GenreItem(
      {super.key,
      required this.title,
      required this.isMovie,
      required this.id});

  final String title;
  final int id;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigators.pushNamed(Routes.type, arguments: {
          'title': title,
          'isMovie': isMovie,
          'id': id,
        });
      },
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
