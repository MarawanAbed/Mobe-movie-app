import 'package:flutter/material.dart';
import 'package:movie_app/movie/home/presentation/widgets/favorite/tv_favorite_body.dart';

class TvFavoritePage extends StatelessWidget {
  const TvFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TvSeries Favorite'),
      ),
      body: const TvFavoriteBody(),
    );
  }
}
