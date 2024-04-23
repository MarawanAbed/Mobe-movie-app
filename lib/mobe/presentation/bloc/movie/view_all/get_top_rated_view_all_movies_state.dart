part of 'get_top_rated_view_all_movies_cubit.dart';

@freezed
class GetTopRatedViewAllMoviesState with _$GetTopRatedViewAllMoviesState {
  const factory GetTopRatedViewAllMoviesState.initial() = _Initial;

  const factory GetTopRatedViewAllMoviesState.loading() = Loading;

  const factory GetTopRatedViewAllMoviesState.paginationLoading() = PaginationLoading;

  const factory GetTopRatedViewAllMoviesState.loaded(List<MovieModel> movies) = Loaded;

  const factory GetTopRatedViewAllMoviesState.error(String error) = Error;
}
