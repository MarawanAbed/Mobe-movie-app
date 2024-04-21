part of 'similar_movies_cubit.dart';

@freezed
class SimilarMoviesState with _$SimilarMoviesState {
  const factory SimilarMoviesState.initial() = _Initial;

  const factory SimilarMoviesState.loading() = Loading;


  const factory SimilarMoviesState.loaded(List<MovieModel> movies) = Loaded;


const factory SimilarMoviesState.error(String message) = Error;
}
