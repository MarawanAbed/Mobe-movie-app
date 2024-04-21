part of 'get_top_rated_movies_cubit.dart';

@freezed
class GetTopRatedMoviesState with _$GetTopRatedMoviesState {
  const factory GetTopRatedMoviesState.initial() = _Initial;

  const factory GetTopRatedMoviesState.loading() = Loading;


  const factory GetTopRatedMoviesState.loaded(List<MovieModel> movies) = Loaded;


  const factory GetTopRatedMoviesState.error(String message) = Error;
}
