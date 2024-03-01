import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';
import 'package:movie_app/movie/home/presentation/manager/favorite_cubit.dart';
import 'package:movie_app/movie/home/presentation/widgets/favorite/build_favorites_items.dart';

class TvFavoriteBlocBuilder extends StatefulWidget {
  const TvFavoriteBlocBuilder({super.key});

  @override
  State<TvFavoriteBlocBuilder> createState() => _TvFavoriteBlocBuilderState();
}

class _TvFavoriteBlocBuilderState extends State<TvFavoriteBlocBuilder> {

  @override
  void initState() {
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
          List<FavoriteModel> tvs = favorites.where((favorite) => !favorite.isMovie).toList();
          return favorites.isEmpty
              ? const Center(child: Text('No Favorites Yet'))
              : BuildFavoritesItems(
            isMovie: false,
            tv: tvs,
          );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
