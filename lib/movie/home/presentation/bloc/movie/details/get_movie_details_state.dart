part of 'get_movie_details_cubit.dart';

@freezed
class GetMovieDetailsState with _$GetMovieDetailsState {
  const factory GetMovieDetailsState.initial() = _Initial;

  const factory GetMovieDetailsState.loading() = Loading;


  const factory GetMovieDetailsState.loaded(MovieDetailsModel movieDetails) = Loaded;


const factory GetMovieDetailsState.error(String message) = Error;
}
