import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/favorite/movies_favorite_body.dart';

class MoviesFavoritePage extends StatelessWidget {
  const MoviesFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movies Favorite'),
      ),
      body: const MoviesFavoriteBody(),
    );
  }
}
