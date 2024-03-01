import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/helpers/helper_methods.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  List<FavoriteModel> favorites = []; // Add this line to declare the list of favorites

  FavoriteCubit() : super(FavoriteInitial());

  void addFavorite(FavoriteModel favorite) {
    favorites.add(favorite);
    HelperMethod.showSuccessToast('Added to favorite');
    emit(FavoriteAdded());
  }

  void removeFavorite(int id) {
    var box = Hive.box<FavoriteModel>(AppStrings.favoriteBoxName);
    box.delete(id);
    favorites.removeWhere((favorite) => favorite.id == id);
    emit(FavoriteRemoved());
  }

  void getFavorite() {
    var box = Hive.box<FavoriteModel>(AppStrings.favoriteBoxName);
    favorites = box.values.toList(); // Update the list of favorites
    emit(FavoriteLoaded(favorites));
  }

}
