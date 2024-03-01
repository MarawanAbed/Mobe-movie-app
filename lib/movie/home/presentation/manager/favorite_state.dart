part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}


class FavoriteLoaded extends FavoriteState {
  final List<FavoriteModel> favorites;

  FavoriteLoaded(this.favorites);
}


class FavoriteAdded extends FavoriteState {}


class FavoriteRemoved extends FavoriteState {}


