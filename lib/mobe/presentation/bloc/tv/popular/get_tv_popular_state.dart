part of 'get_tv_popular_cubit.dart';

@freezed
class GetTvPopularState with _$GetTvPopularState {
  const factory GetTvPopularState.initial() = _Initial;

  const factory GetTvPopularState.loading() = Loading;

  const factory GetTvPopularState.paginationLoading() = PaginationLoading;
  const factory GetTvPopularState.loaded(List<TvModel> tvs) = Loaded;

  const factory GetTvPopularState.error(String message) = Error;
}
