import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/favorite/favorite_body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoriteBody(),
    );
  }
}
