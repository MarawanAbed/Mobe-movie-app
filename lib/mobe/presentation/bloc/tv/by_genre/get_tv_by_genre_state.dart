part of 'get_tv_by_genre_cubit.dart';

@freezed
class GetTvByGenreState with _$GetTvByGenreState {
  const factory GetTvByGenreState.initial() = _Initial;


  const factory GetTvByGenreState.loading() = Loading;


  const factory GetTvByGenreState.paginationLoading() = PaginationLoading;

  const factory GetTvByGenreState.loaded(List<TvModel> tv) = Loaded;


  const factory GetTvByGenreState.error(String message) = Error;
}
