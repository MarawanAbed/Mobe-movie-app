import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';

part 'favorites_cubit.freezed.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState.initial());

  static  FavoritesCubit get(context) => BlocProvider.of<FavoritesCubit>(context);

  List<FavoriteModel> favorites = [];

  void addFavorite(FavoriteModel favorite) {
    favorites.add(favorite);
  }

  void removeFavorite(int id) {
    var box = Hive.box<FavoriteModel>(AppStrings.favoriteBoxName);
    box.delete(id);
    favorites.removeWhere((favorite) => favorite.id == id);
  }

  void getFavorite() {
    var box = Hive.box<FavoriteModel>(AppStrings.favoriteBoxName);
    favorites = box.values.toList();
    emit(FavoritesState.loaded(favorites));
  }
}
