part of 'get_popular_movies_cubit.dart';

@freezed
class GetPopularMoviesState with _$GetPopularMoviesState {
  const factory GetPopularMoviesState.initial() = _Initial;

  const factory GetPopularMoviesState.loading() = Loading;

  const factory GetPopularMoviesState.paginationLoading() = PaginationLoading;
  const factory GetPopularMoviesState.loaded(List<MovieModel> movies) = Loaded;


const factory GetPopularMoviesState.error(String message) = Error;
}
