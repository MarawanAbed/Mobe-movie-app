part of 'search_tv_cubit.dart';

@freezed
class SearchTvState with _$SearchTvState {
  const factory SearchTvState.initial() = _Initial;


  const factory SearchTvState.loaded(List<TvModel> tvs) = Loaded;

  const factory SearchTvState.paginationLoading() = PaginationLoading;

  const factory SearchTvState.error(String message) = Error;
}