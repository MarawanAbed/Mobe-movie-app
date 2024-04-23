part of 'get_movies_by_genre_cubit.dart';

@freezed
class GetMoviesByGenreState with _$GetMoviesByGenreState {
  const factory GetMoviesByGenreState.initial() = _Initial;

  const factory GetMoviesByGenreState.loading() = Loading;

  const factory GetMoviesByGenreState.paginationLoading() = PaginationLoading;
  const factory GetMoviesByGenreState.loaded(List<MovieModel> movies) = Loaded;

  const factory GetMoviesByGenreState.error(String message) = Error;
}
