part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;

  const factory FavoritesState.loaded(List<FavoriteModel> favorites) = Loaded;

  const factory FavoritesState.error(String error) = Error;


}
