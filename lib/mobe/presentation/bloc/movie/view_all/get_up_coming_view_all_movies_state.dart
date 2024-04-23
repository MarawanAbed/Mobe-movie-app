part of 'get_up_coming_view_all_movies_cubit.dart';

@freezed
class GetUpComingViewAllMoviesState with _$GetUpComingViewAllMoviesState {
  const factory GetUpComingViewAllMoviesState.initial() = _Initial;

  const factory GetUpComingViewAllMoviesState.loading() = Loading;

  const factory GetUpComingViewAllMoviesState.paginationLoading() = PaginationLoading;

  const factory GetUpComingViewAllMoviesState.loaded(List<MovieModel> movies) = Loaded;

  const factory GetUpComingViewAllMoviesState.error(String error) = Error;
}
