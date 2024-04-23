import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../lib_imports.dart';

part 'get_movies_by_genre_state.dart';
part 'get_movies_by_genre_cubit.freezed.dart';

class GetMoviesByGenreCubit extends Cubit<GetMoviesByGenreState> {
  GetMoviesByGenreCubit(this._getMovieByGenre) : super(const GetMoviesByGenreState.initial());

  final GetMovieByGenre _getMovieByGenre;

  int _nextPage = 1;
  void getMoviesByGenre(int genreId) async {
    if(_nextPage==1) {
      emit(const GetMoviesByGenreState.loading());
    } else {
      emit(const GetMoviesByGenreState.paginationLoading());
    }
    final result = await _getMovieByGenre(genreId, _nextPage);
    result.when(
      success: (movies) {
        _nextPage++;
        emit(GetMoviesByGenreState.loaded(movies));
      },
      failure: (message) {
        emit(GetMoviesByGenreState.error(message.toString()));
      },
    );
  }
}
