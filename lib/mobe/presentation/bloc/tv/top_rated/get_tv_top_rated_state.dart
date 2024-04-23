part of 'get_tv_top_rated_cubit.dart';

@freezed
class GetTvTopRatedState with _$GetTvTopRatedState {
  const factory GetTvTopRatedState.initial() = _Initial;

  const factory GetTvTopRatedState.loading() = Loading;

  const factory GetTvTopRatedState.paginationLoading() = PaginationLoading;

  const factory GetTvTopRatedState.loaded(List<TvModel> tvs) = Loaded;

  const factory GetTvTopRatedState.error(String message) = Error;
}
