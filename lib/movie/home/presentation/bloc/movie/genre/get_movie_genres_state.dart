part of 'get_movie_genres_cubit.dart';

@freezed
class GetMovieGenresState with _$GetMovieGenresState {
  const factory GetMovieGenresState.initial() = _Initial;

  const factory GetMovieGenresState.loading() = Loading;


  const factory GetMovieGenresState.loaded(List<GenresModel> genres) = Loaded;


const factory GetMovieGenresState.error(String message) = Error;
}
