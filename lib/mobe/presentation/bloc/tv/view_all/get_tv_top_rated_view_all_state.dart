part of 'get_tv_top_rated_view_all_cubit.dart';

@freezed
class GetTvTopRatedViewAllState with _$GetTvTopRatedViewAllState {
  const factory GetTvTopRatedViewAllState.initial() = _Initial;

  const factory GetTvTopRatedViewAllState.loading() = Loading;


  const factory GetTvTopRatedViewAllState.paginationLoading() = PaginationLoading;


  const factory GetTvTopRatedViewAllState.loaded(List<TvModel> tvs) = Loaded;


  const factory GetTvTopRatedViewAllState.error(String message) = Error;
}
