part of 'get_tv_genres_cubit.dart';

@freezed
class GetTvGenresState with _$GetTvGenresState {
  const factory GetTvGenresState.initial() = _Initial;

  const factory GetTvGenresState.loading() = Loading;

  const factory GetTvGenresState.loaded(List<GenresModel> genres) = Loaded;

  const factory GetTvGenresState.error(String message) = Error;
}
