part of 'get_tv_airing_today_view_all_cubit.dart';

@freezed
class GetTvAiringTodayViewAllState with _$GetTvAiringTodayViewAllState {
  const factory GetTvAiringTodayViewAllState.initial() = _Initial;

  const factory GetTvAiringTodayViewAllState.loading() = Loading;


  const factory GetTvAiringTodayViewAllState.paginationLoading() = PaginationLoading;


  const factory GetTvAiringTodayViewAllState.loaded(List<TvModel> tvs) = Loaded;


  const factory GetTvAiringTodayViewAllState.error(String message) = Error;
}
