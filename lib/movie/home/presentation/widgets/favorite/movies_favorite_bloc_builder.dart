import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';
import 'package:movie_app/movie/home/presentation/manager/favorite_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/favorite/build_favorites_items.dart';

class MoviesFavoriteBlocBuilder extends StatefulWidget {
  const MoviesFavoriteBlocBuilder({super.key});

  @override
  State<MoviesFavoriteBlocBuilder> createState() =>
      _MoviesFavoriteBlocBuilderState();
}

class _MoviesFavoriteBlocBuilderState extends State<MoviesFavoriteBlocBuilder> {
  @override
  initState() {
    context.read<FavoriteCubit>().getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteInitial) {
          return const CircularProgressIndicator();
        } else if (state is FavoriteLoaded) {
          List<FavoriteModel> favorites = state.favorites;
          List<FavoriteModel> movies =
              favorites.where((favorite) => favorite.isMovie).toList();
          return favorites.isEmpty
              ? const Center(child: Text('No Favorites Yet'))
              : BuildFavoritesItems(
                  isMovie: true,
                  movies: movies,
                );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
