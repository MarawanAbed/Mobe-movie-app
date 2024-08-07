part of 'search_movies_cubit.dart';

@freezed
class SearchMoviesState with _$SearchMoviesState {
  const factory SearchMoviesState.initial() = _Initial;


  const factory SearchMoviesState.loaded(List<MovieModel> movies) = Loaded;

  const factory SearchMoviesState.paginationLoading() = PaginationLoading;

  const factory SearchMoviesState.error(String message) = Error;
}
