import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_movie_by_genre.dart';

part 'get_movies_by_genre_state.dart';
part 'get_movies_by_genre_cubit.freezed.dart';

class GetMoviesByGenreCubit extends Cubit<GetMoviesByGenreState> {
  GetMoviesByGenreCubit(this._getMovieByGenre) : super(const GetMoviesByGenreState.initial());

  final GetMovieByGenre _getMovieByGenre;

  void getMoviesByGenre(int genreId) async {
    emit(const GetMoviesByGenreState.loading());
    final result = await _getMovieByGenre(genreId);
    result.when(
      success: (movies) {
        emit(GetMoviesByGenreState.loaded(movies));
      },
      failure: (message) {
        emit(GetMoviesByGenreState.error(message.toString()));
      },
    );
  }
}
