part of 'get_tv_popular_view_all_cubit.dart';

@freezed
class GetTvPopularViewAllState with _$GetTvPopularViewAllState {
  const factory GetTvPopularViewAllState.initial() = _Initial;


  const factory GetTvPopularViewAllState.loading() = Loading;


  const factory GetTvPopularViewAllState.paginationLoading() = PaginationLoading;


  const factory GetTvPopularViewAllState.loaded(List<TvModel> tv) = Loaded;


  const factory GetTvPopularViewAllState.error(String message) = Error;
}
