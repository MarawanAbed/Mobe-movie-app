import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';
import 'package:movie_app/movie/home/presentation/manager/favorites/favorites_cubit.dart';
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
    var cubit = FavoritesCubit.get(context);
    cubit.getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded:(favorite)
          {
            List<FavoriteModel> favorites = favorite;
            List<FavoriteModel> movies =
            favorites.where((favorite) => favorite.isMovie).toList();
            return favorites.isEmpty
                ? const Center(child: Text(AppStrings.noFavoritesYet))
                : BuildFavoritesItems(
              isMovie: true,
              movies: movies,
            );
          } ,
          error: (message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
