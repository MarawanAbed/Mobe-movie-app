part of 'get_tv_details_cubit.dart';

@freezed
class GetTvDetailsState with _$GetTvDetailsState {
  const factory GetTvDetailsState.initial() = _Initial;

  const factory GetTvDetailsState.loading() = Loading;

  const factory GetTvDetailsState.loaded(TvDetailsModel tv) = Loaded;

  const factory GetTvDetailsState.error(String message) = Error;
}
