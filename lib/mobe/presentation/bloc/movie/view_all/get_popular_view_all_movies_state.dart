part of 'get_popular_view_all_movies_cubit.dart';

@freezed
class GetPopularViewAllMoviesState with _$GetPopularViewAllMoviesState {
  const factory GetPopularViewAllMoviesState.initial() = _Initial;

  const factory GetPopularViewAllMoviesState.loading() = Loading;

  const factory GetPopularViewAllMoviesState.paginationLoading() = PaginationLoading;

  const factory GetPopularViewAllMoviesState.loaded(List<MovieModel> movies) = Loaded;

  const factory GetPopularViewAllMoviesState.error(String error) = Error;
}
