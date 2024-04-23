part of 'similar_tv_cubit.dart';

@freezed
class SimilarTvState with _$SimilarTvState {
  const factory SimilarTvState.initial() = _Initial;

  const factory SimilarTvState.loading() = Loading;

  const factory SimilarTvState.paginationLoading() = PaginationLoading;

  const factory SimilarTvState.loaded(List<TvModel> tvs) = Loaded;

  const factory SimilarTvState.error(String message) = Error;
}
