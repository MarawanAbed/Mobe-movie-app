part of 'get_airing_today_cubit.dart';

@freezed
class GetAiringTodayState with _$GetAiringTodayState {
  const factory GetAiringTodayState.initial() = _Initial;

  const factory GetAiringTodayState.loading() = Loading;

  const factory GetAiringTodayState.loaded(List<TvModel> tvs) = Loaded;


  const factory GetAiringTodayState.error(String message) = Error;
}
