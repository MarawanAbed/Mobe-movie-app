part of 'get_up_coming_movies_cubit.dart';

@freezed
class GetUpComingMoviesState with _$GetUpComingMoviesState {
  const factory GetUpComingMoviesState.initial() = _Initial;

  const factory GetUpComingMoviesState.loading() = Loading;

  const factory GetUpComingMoviesState.paginationLoading() = PaginationLoading;
  const factory GetUpComingMoviesState.loaded(List<MovieModel> movies) = Loaded;

  const factory GetUpComingMoviesState.error(String message) = Error;
}
